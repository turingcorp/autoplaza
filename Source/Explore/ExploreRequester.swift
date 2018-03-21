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
        onSuccess:@escaping(([MotorProtocol]) -> ()),
        onError:@escaping((Error) -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadMotorsInBackground(configuration:configuration, onSuccess:onSuccess, onError:onError)
        }
    }
    
    private func loadMotorsInBackground(
        configuration:SearchConfiguration,
        onSuccess:@escaping(([MotorProtocol]) -> ()),
        onError:@escaping((Error) -> ())) {
        let request:URLRequest = ExploreRequester.factoryRequest(configuration:configuration)
        let task:URLSessionDataTask = self.session.dataTask(
        with:request) { [weak self] (data:Data?, response:URLResponse?, error:Error?) in
            let motors:[MotorProtocol]?
            do {
                try motors = self?.motorsRequestResponse(data:data, error:error)
            } catch let error {
                onError(error)
                return
            }
            if let motors:[MotorProtocol] = motors {
                onSuccess(motors)
            }
        }
        task.resume()
    }
    
    private func motorsRequestResponse(data:Data?, error:Error?) throws -> [MotorProtocol] {
        if let error:Error = error {
            throw error
        }
        guard
            let data:Data = data
        else {
            throw ErrorLocal.noDataReceived
        }
        let motors:[MotorProtocol] = try self.parser.parse(data:data)
        return motors
    }
}


// https://api.mercadolibre.com/sites/MLM/search?category=1743&limit=1&offset=0
