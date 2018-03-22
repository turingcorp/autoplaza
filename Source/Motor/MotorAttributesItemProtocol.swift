import Foundation

protocol MotorAttributesItemProtocol {
    static var identifier:String { get }
    var name:String { get }
    
    init?(value:String)
}
