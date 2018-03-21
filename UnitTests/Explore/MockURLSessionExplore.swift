import Foundation

class MockURLSessionExplore:URLSession {
    var data:Data?
    var response:URLResponse?
    var error:Error?
    
    override func dataTask(
        with request:URLRequest,
        completionHandler:@escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(self.data, self.response, self.error)
        return MockURLSessionDataTaskExplore()
    }
}
