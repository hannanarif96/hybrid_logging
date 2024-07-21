import Foundation

class MainViewModel {
    
    private let logger: Logger
    var logsList = [String]()
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func logData(className: String) {
        logsList.append(logger.logDebug(className))
        logsList.append(logger.logInfo(className))
        logsList.append(logger.logWarn(className))
        logsList.append(logger.logError(className))
    }
}
