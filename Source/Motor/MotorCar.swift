import Foundation

class MotorCar:MotorProtocol {
    var seller:MotorSeller
    var address:MotorAddress
    var attributes:[MotorAttributesItemProtocol]
    
    init() {
        self.seller = MotorSeller()
        self.address = MotorAddress()
        self.attributes = []
    }
}
