import Foundation

extension Coredata {
    func loadSearchConfiguration(completion:@escaping((SearchConfiguration) -> ())) {
        self.loadCoredataSearchConfiguration(found: { [weak self] (configuration:CoredataSearchConfiguration) in
            self?.translate(configuration:configuration, completion:completion)
        }, notFound: { [weak self] in
            self?.createCoredataSearchConfiguration { (configuration:CoredataSearchConfiguration) in
                self?.translate(configuration:configuration, completion:completion)
            }
        })
    }
    
    func loadCoredataSearchConfiguration(
        found:@escaping((CoredataSearchConfiguration) -> ()),
        notFound:@escaping(() -> ())) {
        
    }
    
    func createCoredataSearchConfiguration(completion:@escaping((CoredataSearchConfiguration) -> ())) {
        
    }
    
    private func translate(
        configuration:CoredataSearchConfiguration,
        completion:@escaping((SearchConfiguration) -> ())) {
        
    }
}
