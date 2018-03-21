import Foundation

extension ExploreRequester {
    class func factorySession() -> URLSession {
        return URLSession()
    }
    
    class func factoryRequest(configuration:SearchConfiguration) -> URLRequest {
        return URLRequest(url:URL(fileURLWithPath:String()))
    }
}
