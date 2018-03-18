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
    }
}
