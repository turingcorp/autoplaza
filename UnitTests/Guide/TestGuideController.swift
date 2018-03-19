import XCTest
@testable import autoplaza

class TestGuideController: XCTestCase {
    private var controller:GuideController!
    
    override func setUp() {
        super.setUp()
        self.controller = GuideController()
    }
    
    func testInit() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
