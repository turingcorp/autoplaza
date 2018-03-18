import XCTest
@testable import autoplaza

class TestStructure:XCTestCase {
    private var structure:Structure?
    
    override func setUp() {
        super.setUp()
        self.structure = Structure()
    }
    
    func testInit() {
        XCTAssertNotNil(self.structure, "Failed to load structure")
        XCTAssertNotNil(self.structure?.items, "Structure has no items")
    }
    
    func testFactory() {
        let items:[StructureItemProtocol] = Structure.factoryItems()
        XCTAssertGreaterThan(items.count, 0, "Factorised items is empty")
    }
    
    func testItemsIndex() {
        guard
            let items:[StructureItemProtocol] = self.structure?.items
        else {
            return
        }
        var previousIndex:Int = -1
        for item:StructureItemProtocol in items {
            XCTAssertGreaterThan(item.index, previousIndex, "Item index is not in order")
            previousIndex = item.index
        }
    }
}
