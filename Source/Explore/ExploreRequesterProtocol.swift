import Foundation

protocol ExploreRequesterProtocol {
    func loadMotors(
        configuration:SearchConfiguration,
        success:@escaping(([MotorProtocol]) -> ()),
        error:@escaping((Error) -> ()))
}
