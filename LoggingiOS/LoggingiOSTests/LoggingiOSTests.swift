import XCTest
@testable import LoggingiOS

class LoggerTests: XCTestCase {
    private var logger: Logger!
    private let logFilePath = "test.log"
    
    override func setUp() {
        super.setUp()
        // Clean up the log file before each test
        try? FileManager.default.removeItem(atPath: logFilePath)
        logger = Logger(logToFile: true, logFilePath: logFilePath)
    }
    
    func testLogDebug_withDebugLevel() {
        logger.setLogLevel(.debug)
        let message = "Debug message"
        let log = logger.logDebug(message)
        XCTAssertTrue(log.contains("[DEBUG] \(message)"))
    }
    
    func testLogInfo_withDebugLevel() {
        logger.setLogLevel(.debug)
        let message = "Info message"
        let log = logger.logInfo(message)
        XCTAssertTrue(log.contains("[INFO] \(message)"))
    }
    
    func testLogWarn_withDebugLevel() {
        logger.setLogLevel(.debug)
        let message = "Warn message"
        let log = logger.logWarn(message)
        XCTAssertTrue(log.contains("[WARN] \(message)"))
    }
    
    func testLogError_withDebugLevel() {
        logger.setLogLevel(.debug)
        let message = "Error message"
        let log = logger.logError(message)
        XCTAssertTrue(log.contains("[ERROR] \(message)"))
    }
    
    func testLogDebug_withInfoLevel() {
        logger.setLogLevel(.info)
        let message = "Debug message"
        let log = logger.logDebug(message)
        XCTAssertEqual("", log)
    }
    
    func testLogInfo_withInfoLevel() {
        logger.setLogLevel(.info)
        let message = "Info message"
        let log = logger.logInfo(message)
        XCTAssertTrue(log.contains("[INFO] \(message)"))
    }
    
    func testLogWarn_withInfoLevel() {
        logger.setLogLevel(.info)
        let message = "Warn message"
        let log = logger.logWarn(message)
        XCTAssertTrue(log.contains("[WARN] \(message)"))
    }
    
    func testLogError_withInfoLevel() {
        logger.setLogLevel(.info)
        let message = "Error message"
        let log = logger.logError(message)
        XCTAssertTrue(log.contains("[ERROR] \(message)"))
    }
    
    func testLogDebug_withWarnLevel() {
        logger.setLogLevel(.warn)
        let message = "Debug message"
        let log = logger.logDebug(message)
        XCTAssertEqual("", log)
    }
    
    func testLogInfo_withWarnLevel() {
        logger.setLogLevel(.warn)
        let message = "Info message"
        let log = logger.logInfo(message)
        XCTAssertEqual("", log)
    }
    
    func testLogWarn_withWarnLevel() {
        logger.setLogLevel(.warn)
        let message = "Warn message"
        let log = logger.logWarn(message)
        XCTAssertTrue(log.contains("[WARN] \(message)"))
    }
    
    func testLogError_withWarnLevel() {
        logger.setLogLevel(.warn)
        let message = "Error message"
        let log = logger.logError(message)
        XCTAssertTrue(log.contains("[ERROR] \(message)"))
    }
    
    func testLogDebug_withErrorLevel() {
        logger.setLogLevel(.error)
        let message = "Debug message"
        let log = logger.logDebug(message)
        XCTAssertEqual("", log)
    }
    
    func testLogInfo_withErrorLevel() {
        logger.setLogLevel(.error)
        let message = "Info message"
        let log = logger.logInfo(message)
        XCTAssertEqual("", log)
    }
    
    func testLogWarn_withErrorLevel() {
        logger.setLogLevel(.error)
        let message = "Warn"
    }
}
