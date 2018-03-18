import Foundation

extension Structure {
    private static var types:[StructureItemProtocol.Type] {
        get {
            return [
                StructureItemExplore.self]
        }
    }
    
    class func factoryItems() -> [StructureItemProtocol] {
        var items:[StructureItemProtocol] = []
        for type:StructureItemProtocol.Type in self.types {
            let item:StructureItemProtocol = type.init(index:items.count)
            items.append(item)
        }
        return items
    }
}
