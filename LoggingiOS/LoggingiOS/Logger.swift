import Foundation

enum LogLevel: String {
    case debug = "DEBUG"
    case info = "INFO"
    case warn = "WARN"
    case error = "ERROR"
}

class Logger {
    private var currentLogLevel: LogLevel = .debug
    private let logToFile: Bool
    private let logFilePath: String?
    private let maxLogSize: Int
    private let rotationThreshold: Int

    private var logCount: Int = 0
    
    init(logToFile: Bool = false, logFilePath: String? = "application.log", maxLogSize: Int = 1_048_576, rotationThreshold: Int = 10) {
        self.logToFile = logToFile
        self.logFilePath = logFilePath
        self.maxLogSize = maxLogSize
        self.rotationThreshold = rotationThreshold

        if logToFile, logFilePath == nil {
            fatalError("Log file path cannot be nil")
        }
    }

    func setLogLevel(_ level: LogLevel) {
        currentLogLevel = level
    }

    func logDebug(_ message: String) -> String {
        return log(.debug, message)
    }

    func logInfo(_ message: String) -> String {
        return log(.info, message)
    }

    func logWarn(_ message: String) -> String {
        return log(.warn, message)
    }

    func logError(_ message: String) -> String {
        return log(.error, message)
    }

    private func log(_ level: LogLevel, _ message: String) -> String {
        if shouldLog(for: level) {
            let formattedLog = formatLog(level, message)
            if logToFile {
                writeToFile(formattedLog)
            }
            return formattedLog
        }
        return ""
    }

    private func shouldLog(for level: LogLevel) -> Bool {
        switch currentLogLevel {
        case .debug: return true
        case .info: return level != .debug
        case .warn: return level == .warn || level == .error
        case .error: return level == .error
        }
    }

    private func formatLog(_ level: LogLevel, _ message: String) -> String {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        return "\(timestamp) [\(level.rawValue)] \(message)"
    }

    private func writeToFile(_ log: String) {
        guard let filePath = logFilePath else { return }
        
        let fileURL = URL(fileURLWithPath: filePath)
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            let fileAttributes = try? fileManager.attributesOfItem(atPath: filePath)
            if let fileSize = fileAttributes?[FileAttributeKey.size] as? Int, fileSize >= maxLogSize {
                rotateLogFiles()
            }
        }
        
        if let fileHandle = try? FileHandle(forWritingTo: fileURL) {
            fileHandle.seekToEndOfFile()
            if let data = (log + "\n").data(using: .utf8) {
                fileHandle.write(data)
            }
            fileHandle.closeFile()
            logCount += 1
        } else {
            do {
                try log.write(to: fileURL, atomically: true, encoding: .utf8)
                logCount += 1
            } catch {
                print("Failed to write log to file: \(error.localizedDescription)")
            }
        }
    }

    private func rotateLogFiles() {
        guard let filePath = logFilePath else { return }
        
        let fileManager = FileManager.default
        let fileURL = URL(fileURLWithPath: filePath)
        
        for i in (1...rotationThreshold).reversed() {
            let oldFileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(fileURL.deletingPathExtension().lastPathComponent)_\(i).\(fileURL.pathExtension)")
            let newFileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(fileURL.deletingPathExtension().lastPathComponent)_\(i + 1).\(fileURL.pathExtension)")
            
            if fileManager.fileExists(atPath: oldFileURL.path) {
                try? fileManager.moveItem(at: oldFileURL, to: newFileURL)
            }
        }
        
        let newFileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(fileURL.deletingPathExtension().lastPathComponent)_1.\(fileURL.pathExtension)")
        try? fileManager.moveItem(at: fileURL, to: newFileURL)
    }

    func getLogCount() -> Int {
        return logCount
    }

    func clearLogs() {
        guard let filePath = logFilePath else { return }
        
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            try "".write(to: fileURL, atomically: true, encoding: .utf8)
            logCount = 0
        } catch {
            print("Failed to clear logs: \(error.localizedDescription)")
        }
    }

    func getLogFileSize() -> Int {
        guard let filePath = logFilePath else { return 0 }
        
        let fileURL = URL(fileURLWithPath: filePath)
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            do {
                let fileAttributes = try fileManager.attributesOfItem(atPath: filePath)
                return fileAttributes[FileAttributeKey.size] as? Int ?? 0
            } catch {
                print("Failed to get log file size: \(error.localizedDescription)")
            }
        }
        return 0
    }
}

