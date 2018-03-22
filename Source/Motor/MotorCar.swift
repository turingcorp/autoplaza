import Foundation

class MotorCar:MotorProtocol {
    var seller:MotorSeller
    var address:MotorAddress
    
    init() {
        self.seller = MotorSeller()
        self.address = MotorAddress()
    }
}
