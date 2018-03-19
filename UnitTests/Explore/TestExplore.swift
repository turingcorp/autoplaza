import XCTest
@testable import autoplaza

class TestExplore:XCTestCase {
    private var explore:Explore!
    
    override func setUp() {
        super.setUp()
        self.explore = Explore()
    }
    
    func testInit() {
        XCTAssertNotNil(self.explore, "Failed to load explore")
    }
}
