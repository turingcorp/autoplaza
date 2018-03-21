import Foundation
import CoreData

extension Coredata {
    private var request:NSFetchRequest<CoredataSearchConfiguration> {
        get {
            let request:NSFetchRequest<CoredataSearchConfiguration> = Coredata.factoryFetchRequest()
            request.fetchLimit = 1
            return request
        }
    }
    
    func loadSearchConfiguration(completion:@escaping((SearchConfiguration) -> ())) {
        self.loadCoredataSearchConfiguration(found: { (configuration:CoredataSearchConfiguration) in
            self.searchConfigurationLoaded(configuration:configuration, completion:completion)
        }, notFound: {
            self.createCoredataSearchConfiguration { (configuration:CoredataSearchConfiguration) in
                self.searchConfigurationLoaded(configuration:configuration, completion:completion)
            }
        })
    }
    
    func loadCoredataSearchConfiguration(
        found:@escaping((CoredataSearchConfiguration) -> ()),
        notFound:@escaping(() -> ())) {
        self.load(request:self.request) { (configurations:[CoredataSearchConfiguration]) in
            guard
                let configuration:CoredataSearchConfiguration = configurations.first
            else {
                notFound()
                return
            }
            found(configuration)
        }
    }
    
    func createCoredataSearchConfiguration(completion:@escaping((CoredataSearchConfiguration) -> ())) {
        self.create(completion:completion)
    }
    
    private func searchConfigurationCreated(
        configuration:CoredataSearchConfiguration,
        completion:@escaping((SearchConfiguration) -> ())) {
        
    }
    
    private func searchConfigurationLoaded(
        configuration:CoredataSearchConfiguration,
        completion:@escaping((SearchConfiguration) -> ())) {
        let model:SearchConfiguration = configuration.factoryConfiguration()
        completion(model)
    }
}
