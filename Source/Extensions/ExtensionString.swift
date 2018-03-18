import Foundation

extension String {
    private struct Constants {
        static let tableSimulation:String = "LocalizableSimulation"
    }
    
    static func localizedSimulation(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableSimulation, comment:String())
    }
}
