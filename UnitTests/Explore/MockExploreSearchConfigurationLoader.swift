import Foundation
@testable import autoplaza

class MockExploreSearchConfigurationLoader:ExploreSearchConfigurationLoader {
    override func load(database:DatabaseProtocol, completion:@escaping((SearchConfiguration) -> ())) {
        let configuration:SearchConfiguration = SearchConfiguration.factoryBasic()
        completion(configuration)
    }
}
