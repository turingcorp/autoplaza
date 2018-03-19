import Foundation

class Structure {
    var selected:StructureItemProtocol
    let items:[StructureItemProtocol]
    
    init() {
        self.items = Structure.factoryItems()
        self.selected = self.items[Constants.initialIndex]
    }
    
    func itemFor(itemType:StructureItemProtocol.Type) -> StructureItemProtocol? {
        for item:StructureItemProtocol in self.items {
            let currentType:StructureItemProtocol.Type = type(of:item)
            if currentType == itemType {
                return item
            }
        }
        
        return nil
    }
}
