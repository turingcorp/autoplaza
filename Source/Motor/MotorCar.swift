import Foundation

class MotorCar:MotorProtocol {
    var seller:MotorSeller
    
    init() {
        self.seller = MotorSeller()
    }
}
