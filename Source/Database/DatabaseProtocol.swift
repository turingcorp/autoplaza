import Foundation

protocol DatabaseProtocol {
    func loadSearchConfiguration(completion:@escaping((SearchConfiguration) -> ()))
}
