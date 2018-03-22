import Foundation

class ExploreRequester:ExploreRequesterProtocol {
    let session:URLSession
    let parser:ExploreRequesterParser
    
    init(
        session:URLSession = ExploreRequester.factorySession(),
        parser:ExploreRequesterParser = ExploreRequesterParser()) {
        self.session = session
        self.parser = parser
    }
    
    func loadMotors(
        configuration:SearchConfiguration,
        onSuccess:@escaping((SearchResponse) -> ()),
        onError:@escaping((Error) -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadMotorsInBackground(configuration:configuration, onSuccess:onSuccess, onError:onError)
        }
    }
    
    private func loadMotorsInBackground(
        configuration:SearchConfiguration,
        onSuccess:@escaping((SearchResponse) -> ()),
        onError:@escaping((Error) -> ())) {
        let request:URLRequest = ExploreRequester.factoryRequest(configuration:configuration)
        let task:URLSessionDataTask = self.session.dataTask(
        with:request) { [weak self] (data:Data?, response:URLResponse?, error:Error?) in
            let response:SearchResponse?
            do {
                try response = self?.motorsRequestResponse(data:data, error:error)
            } catch let error {
                onError(error)
                return
            }
            if let response:SearchResponse = response {
                onSuccess(response)
            }
        }
        task.resume()
    }
    
    private func motorsRequestResponse(data:Data?, error:Error?) throws -> SearchResponse {
        if let error:Error = error {
            throw error
        }
        guard
            let data:Data = data
        else {
            throw ErrorLocal.noDataReceived
        }
        let response:SearchResponse = try self.parser.parse(data:data)
        return response
    }
}
