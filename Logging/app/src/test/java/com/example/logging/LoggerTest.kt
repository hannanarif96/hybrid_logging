package com.example.logging

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import java.io.File


class LoggerTest {

//    @Mock
//    private lateinit var mockLogger: Logger

    private lateinit var viewModel: MainViewModel

    private lateinit var factory: MainViewModelFactory

    private lateinit var logger: Logger
    private val logFilePath = "test.log"

    @BeforeEach
    fun setUp() {
//        mockLogger = mock(Logger::class.java)
        logger = Logger(logToFile = true, logFilePath = logFilePath)
        viewModel = MainViewModel(logger)
        factory = MainViewModelFactory(logger)

        File(logFilePath).delete()
    }

    @Test
    fun testLogDebug_levelDebug() {
        logger.setLogLevel(Logger.LogLevel.DEBUG)
        val message = "Debug message"
        val log = logger.logDebug(message)
        assertTrue(log.contains("[DEBUG] $message"))
    }

    @Test
    fun testLogInfo_levelDebug() {
        logger.setLogLevel(Logger.LogLevel.DEBUG)
        val message = "Info message"
        val log = logger.logInfo(message)
        assertTrue(log.contains("[INFO] $message"))
    }

    @Test
    fun testLogWarn_levelDebug() {
        logger.setLogLevel(Logger.LogLevel.DEBUG)
        val message = "Warn message"
        val log = logger.logWarn(message)
        assertTrue(log.contains("[WARN] $message"))
    }

    @Test
    fun testLogError_levelDebug() {
        logger.setLogLevel(Logger.LogLevel.DEBUG)
        val message = "Error message"
        val log = logger.logError(message)
        assertTrue(log.contains("[ERROR] $message"))
    }

    @Test
    fun testLogDebug_levelInfo() {
        logger.setLogLevel(Logger.LogLevel.INFO)
        val message = "Debug message"
        val log = logger.logDebug(message)
        assertEquals("", log)
    }

    @Test
    fun testLogInfo_levelInfo() {
        logger.setLogLevel(Logger.LogLevel.INFO)
        val message = "Info message"
        val log = logger.logInfo(message)
        assertTrue(log.contains("[INFO] $message"))
    }

    @Test
    fun testLogWarn_levelInfo() {
        logger.setLogLevel(Logger.LogLevel.INFO)
        val message = "Warn message"
        val log = logger.logWarn(message)
        assertTrue(log.contains("[WARN] $message"))
    }

    @Test
    fun testLogError_levelInfo() {
        logger.setLogLevel(Logger.LogLevel.INFO)
        val message = "Error message"
        val log = logger.logError(message)
        assertTrue(log.contains("[ERROR] $message"))
    }

    @Test
    fun testLogDebug_levelWarn() {
        logger.setLogLevel(Logger.LogLevel.WARN)
        val message = "Debug message"
        val log = logger.logDebug(message)
        assertEquals("", log)
    }

    @Test
    fun testLogInfo_levelWarn() {
        logger.setLogLevel(Logger.LogLevel.WARN)
        val message = "Info message"
        val log = logger.logInfo(message)
        assertEquals("", log)
    }

    @Test
    fun testLogWarn_levelWarn() {
        logger.setLogLevel(Logger.LogLevel.WARN)
        val message = "Warn message"
        val log = logger.logWarn(message)
        assertTrue(log.contains("[WARN] $message"))
    }

    @Test
    fun testLogError_levelWarn() {
        logger.setLogLevel(Logger.LogLevel.WARN)
        val message = "Error message"
        val log = logger.logError(message)
        assertTrue(log.contains("[ERROR] $message"))
    }

    @Test
    fun testLogDebug_levelError() {
        logger.setLogLevel(Logger.LogLevel.ERROR)
        val message = "Debug message"
        val log = logger.logDebug(message)
        assertEquals("", log)
    }

    @Test
    fun testLogInfo_levelError() {
        logger.setLogLevel(Logger.LogLevel.ERROR)
        val message = "Info message"
        val log = logger.logInfo(message)
        assertEquals("", log)
    }

    @Test
    fun testLogWarn_levelError() {
        logger.setLogLevel(Logger.LogLevel.ERROR)
        val message = "Warn message"
        val log = logger.logWarn(message)
        assertEquals("", log)
    }

    @Test
    fun testLogError_levelError() {
        logger.setLogLevel(Logger.LogLevel.ERROR)
        val message = "Error message"
        val log = logger.logError(message)
        assertTrue(log.contains("[ERROR] $message"))
    }

    @Test
    fun testLogFileWriting() {
        val message = "Test file logging"
        logger.logInfo(message)
        val file = File(logFilePath)
        assertTrue(file.exists())
        assertTrue(file.readText().contains("[INFO] $message"))
    }

    @Test
    fun testLogFileSizeManagement() {
        val largeMessage = "A".repeat(1024 * 1024) // 1 MB message
        logger.logInfo(largeMessage)
        assertTrue(File(logFilePath).length() > 0)
    }

    @Test
    fun testLogFileRotation() {
        logger = Logger(logToFile = true, logFilePath = logFilePath, rotationThreshold = 1)
        val message = "Test log rotation"
        logger.logInfo(message)
        assertTrue(File(logFilePath).exists())
    }

    @Test
    fun testClearLogs() {
        logger.logInfo("Message before clearing")
        logger.clearLogs()
        val file = File(logFilePath)
        assertEquals(0, file.length())
    }

    @Test
    fun testGetLogFileSize() {
        val message = "Test log size"
        logger.logInfo(message)
        assertTrue(logger.getLogFileSize() > 0)
    }

    @Test
    fun testInvalidLogFilePath() {
        val exception = assertThrows<IllegalArgumentException> {
            Logger(logToFile = true, logFilePath = null)
        }
        assertEquals("Log file path cannot be null or blank", exception.message)
    }

}
