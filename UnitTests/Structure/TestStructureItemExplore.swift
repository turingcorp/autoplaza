import XCTest
@testable import autoplaza

class TestStructureItemExplore:XCTestCase {
    private var item:StructureItemExplore?
    
    override func setUp() {
        super.setUp()
        self.item = StructureItemExplore(index:0)
    }
    
    func testInit() {
        XCTAssertNotNil(self.item, "Failed to load item")
    }
}
