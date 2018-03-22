import Foundation

struct ErrorLocal:LocalizedError {
    let errorDescription:String?
    
    static let noDataReceived:ErrorLocal = ErrorLocal(errorDescription:
        String.localizedError(key:"Error_noDataReceived"))
    static let malformedServerResponse:ErrorLocal = ErrorLocal(errorDescription:
        String.localizedError(key:"Error_malformedServerResponse"))
}
