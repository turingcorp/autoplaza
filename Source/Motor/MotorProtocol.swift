import Foundation

protocol MotorProtocol {
    var seller:MotorSeller { get set }
    var address:MotorAddress { get set }
    var attributes:[MotorAttributesItemProtocol] { get set }
}
