import Foundation

class Explore {
    var searchConfiguration:SearchConfiguration
    var motors:[MotorProtocol]
    let requester:ExploreRequesterProtocol
    
    init(requester:ExploreRequesterProtocol = ExploreRequester()) {
        self.searchConfiguration = SearchConfiguration.factoryBaseConfiguration()
        self.requester = requester
        self.motors = []
    }
    
    func loadSearchConfiguration(
        searchConfigurationLoader:ExploreSearchConfigurationLoader = ExploreSearchConfigurationLoader(),
        completion:@escaping(() -> ())) {
        searchConfigurationLoader.load { [weak self] (searchConfiguration:SearchConfiguration) in
            self?.searchConfiguration = searchConfiguration
            completion()
        }
    }
}
