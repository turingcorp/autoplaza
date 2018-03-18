import Foundation

extension String {
    private struct Constants {
        static let tableNavigation:String = "LocalizableNavigation"
    }
    
    static func localizedNavigation(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableNavigation, comment:String())
    }
}
