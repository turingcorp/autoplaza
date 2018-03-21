import Foundation

extension CoredataSearchConfiguration {
    func factoryConfiguration() -> SearchConfiguration {
        let configuration:SearchConfiguration = SearchConfiguration.factoryBaseConfiguration()
        return configuration
    }
}
