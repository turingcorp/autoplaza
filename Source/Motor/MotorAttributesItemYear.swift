import Foundation

class MotorAttributesItemYear:MotorAttributesItemProtocol {
    static let identifier:String = "VEHICLE_YEAR"
    let name:String = String.localizableMotor(key:"MotorAttributesItemYear_name")
    let year:Int
    private struct Constants {
        static let minimumYear:Int = 1940
    }
    
    required init?(value:String) {
        guard
            let year:Int = Int(value),
            year >= Constants.minimumYear
        else {
            return nil
        }
        self.year = year
    }
}
