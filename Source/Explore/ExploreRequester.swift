import Foundation

class ExploreRequester:ExploreRequesterProtocol {
    let session:URLSession
    
    init(session:URLSession = ExploreRequester.factorySession()) {
        self.session = session
    }
    
    func loadMotors(
        configuration:SearchConfiguration,
        success:@escaping(([MotorProtocol]) -> ()),
        error:@escaping((Error) -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadMotorsInBackground(configuration:configuration, success:success, error:error)
        }
    }
    
    private func loadMotorsInBackground(
        configuration:SearchConfiguration,
        success:@escaping(([MotorProtocol]) -> ()),
        error:@escaping((Error) -> ())) {
        let request:URLRequest = ExploreRequester.factoryRequest(configuration:configuration)
        let task:URLSessionDataTask = self.session.dataTask(
        with:request) { (data:Data?, response:URLResponse?, error:Error?) in
            
        }
        task.resume()
    }
}


// https://api.mercadolibre.com/sites/MLM/search?category=1743&limit=1&offset=0
