import Foundation

class ExploreSearchConfigurationLoader {
    func load(database:DatabaseProtocol = Coredata(), completion:@escaping((SearchConfiguration) -> ())) {
        self.loadConcurrently(database:database, completion:completion)
    }
    
    private func loadConcurrently(database:DatabaseProtocol, completion:@escaping((SearchConfiguration) -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
            database.loadSearchConfiguration { [weak self] (configuration:SearchConfiguration) in
                self?.returnToMain(configuration:configuration, completion:completion)
            }
        }
    }
    
    private func returnToMain(configuration:SearchConfiguration, completion:@escaping((SearchConfiguration) -> ())) {
        DispatchQueue.main.async {
            completion(configuration)
        }
    }
}
