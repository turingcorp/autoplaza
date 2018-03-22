import Foundation

struct MotorAttributesItemBrand:MotorAttributesItemProtocol {
    static let identifier:String = "BRAND"
    let name:String = String.localizableMotor(key:"MotorAttributesItemBrand_name")
    let brand:String
    private struct Constants {
        static let invalidName:String = " "
    }
    
    init?(value:String) {
        guard
            value.isEmpty == false,
            value != Constants.invalidName
        else {
            return nil
        }
        self.brand = value
    }
}
