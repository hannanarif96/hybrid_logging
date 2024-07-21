package com.example.logging


import java.io.File
import java.io.FileWriter
import java.io.IOException
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.concurrent.atomic.AtomicInteger

class Logger(
    private val logToFile: Boolean = false,
    private val logFilePath: String? = "application.log",
    private val maxLogSize: Int = 1024 * 1024, // 1 MB
    private val rotationThreshold: Int = 10
) {
    enum class LogLevel {
        DEBUG, INFO, WARN, ERROR
    }

    private var currentLogLevel: LogLevel = LogLevel.DEBUG
    private val logCount = AtomicInteger(0)

    init {
        if (logToFile && logFilePath.isNullOrBlank()) {
            throw IllegalArgumentException("Log file path cannot be null or blank")
        }
    }

    fun setLogLevel(level: LogLevel) {
        currentLogLevel = level
    }

    fun logDebug(message: String): String {
        return log(LogLevel.DEBUG, message)
    }

    fun logInfo(message: String): String {
        return log(LogLevel.INFO, message)
    }

    fun logWarn(message: String): String {
        return log(LogLevel.WARN, message)
    }

    fun logError(message: String): String {
        return log(LogLevel.ERROR, message)
    }

    private fun log(level: LogLevel, message: String): String {
        if (currentLogLevel <= level) {
            val formattedLog = formatLog(level, message)
            if (logToFile) {
                writeToFile(formattedLog)
            }
            return formattedLog
        }
        return ""
    }

    private fun formatLog(level: LogLevel, message: String): String {
        val timestamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME)
        return "$timestamp [${level.name}] $message"
    }

    private fun writeToFile(log: String) {
        try {
            val file = File(logFilePath!!)
            if (file.exists() && file.length() >= maxLogSize) {
                rotateLogFiles(file)
            }
            FileWriter(file, true).use { writer ->
                writer.write(log + "\n")
                logCount.incrementAndGet()
            }
        } catch (e: IOException) {
            println("Failed to write log to file: ${e.message}")
        }
    }

    private fun rotateLogFiles(file: File) {
        for (i in rotationThreshold downTo 1) {
            val oldFile = File("${file.parent}/${file.nameWithoutExtension}_$i.${file.extension}")
            val newFile = File("${file.parent}/${file.nameWithoutExtension}_${i + 1}.${file.extension}")
            if (oldFile.exists()) {
                oldFile.renameTo(newFile)
            }
        }
        file.renameTo(File("${file.parent}/${file.nameWithoutExtension}_1.${file.extension}"))
    }

    fun getLogCount(): Int {
        return logCount.get()
    }

    fun clearLogs() {
        try {
            val file = File(logFilePath!!)
            if (file.exists()) {
                file.writeText("")
                logCount.set(0)
            }
        } catch (e: IOException) {
            println("Failed to clear logs: ${e.message}")
        }
    }

    fun getLogFileSize(): Long {
        return try {
            val file = File(logFilePath!!)
            if (file.exists()) file.length() else 0
        } catch (e: IOException) {
            println("Failed to get log file size: ${e.message}")
            0
        }
    }
}
