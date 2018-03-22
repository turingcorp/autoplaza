import Foundation

extension String {
    private struct Constants {
        static let tableNavigation:String = "LocalizableNavigation"
        static let tableError:String = "LocalizableError"
        static let tableMotor:String = "LocalizableMotor"
    }
    
    static func localizedNavigation(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableNavigation, comment:String())
    }
    
    static func localizedError(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableError, comment:String())
    }
    
    static func localizableMotor(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableMotor, comment:String())
    }
}
