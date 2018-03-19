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
    
    func testView() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        let view:ExploreView? = self.controller.view as? ExploreView
        XCTAssertNotNil(view, "View is not the right type")
    }
}
