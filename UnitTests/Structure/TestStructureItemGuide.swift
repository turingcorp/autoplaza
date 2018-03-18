import XCTest
@testable import autoplaza

class TestStructureItemGuide:XCTestCase {
    private var item:StructureItemGuide!
    
    override func setUp() {
        super.setUp()
        self.item = StructureItemGuide(index:0)
    }
    
    func testInit() {
        XCTAssertNotNil(self.item, "Failed to load item")
    }
}
