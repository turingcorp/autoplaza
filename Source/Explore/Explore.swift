import Foundation

class Explore {
    var searchConfiguration:SearchConfiguration
    
    init() {
        self.searchConfiguration = SearchConfiguration.factoryBaseConfiguration()
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
