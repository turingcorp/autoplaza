import Foundation

class Structure {
    var selected:StructureItemProtocol
    let items:[StructureItemProtocol]
    
    init() {
        self.items = Structure.factoryItems()
        self.selected = self.items[Constants.initialIndex]
    }
}
