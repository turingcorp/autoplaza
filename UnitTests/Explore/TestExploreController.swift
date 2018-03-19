import XCTest
@testable import autoplaza

class TestExploreController:XCTestCase {
    private var controller:ExploreController!
    
    override func setUp() {
        super.setUp()
        self.controller = ExploreController()
    }
    
    func testInit() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model in controller")
    }
}
