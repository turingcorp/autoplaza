import Foundation
@testable import autoplaza

class MockDatabase_SearchConfiguration:DatabaseProtocol {
    func loadSearchConfiguration(completion:@escaping((SearchConfiguration) -> ())) {
        let configuration:SearchConfiguration = SearchConfiguration.factoryBaseConfiguration()
        completion(configuration)
    }
}
