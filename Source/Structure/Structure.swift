import Foundation

class Structure {
    let items:[StructureItemProtocol]
    
    init() {
        self.items = Structure.factoryItems()
    }
}
