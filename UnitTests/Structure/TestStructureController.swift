import XCTest
@testable import autoplaza

class TestStructureController:XCTestCase {
    private var controller:StructureController!
    
    override func setUp() {
        super.setUp()
        self.controller = StructureController()
    }
    
    func testInit() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
    }
}
