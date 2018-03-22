import Foundation

protocol ExploreRequesterProtocol {
    func loadMotors(
        configuration:SearchConfiguration,
        onSuccess:@escaping((SearchResponse) -> ()),
        onError:@escaping((Error) -> ()))
}
