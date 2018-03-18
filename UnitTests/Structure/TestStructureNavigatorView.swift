import XCTest
@testable import autoplaza

class TestStructureNavigatorView:XCTestCase {
    private var view:StructureNavigatorView!
    
    override func setUp() {
        super.setUp()
        self.view = StructureNavigatorView()
    }
    
    func testInit() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
