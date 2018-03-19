import XCTest
@testable import autoplaza

class TestStructureNavigatorViewTitle:XCTestCase {
    private var view:StructureNavigatorViewTitle!
    
    override func setUp() {
        super.setUp()
        self.view = StructureNavigatorViewTitle()
    }
    
    func testInit() {
        XCTAssertNotNil(self.view, "Failed to load title view")
        XCTAssertNotNil(self.view.currentTitle, "Failed to load current title")
        XCTAssertNotNil(self.view.animationTitle, "Failed to load animation title")
    }
}
