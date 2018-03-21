import Foundation

protocol ExploreRequesterProtocol {
    func loadMotors(
        configuration:SearchConfiguration,
        onSuccess:@escaping(([MotorProtocol]) -> ()),
        onError:@escaping((Error) -> ()))
}
