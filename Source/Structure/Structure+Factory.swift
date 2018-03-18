import Foundation

extension Structure {
    private static var types:[StructureItemProtocol.Type] {
        get {
            return []
        }
    }
    
    class func factoryItems() -> [StructureItemProtocol] {
        var items:[StructureItemProtocol] = []
        for type:StructureItemProtocol.Type in self.types {
            
        }
        return items
    }
}
