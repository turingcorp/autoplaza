import XCTest
@testable import autoplaza

class TestExploreRequester:XCTestCase {
    private var requester:ExploreRequester!
    
    override func setUp() {
        super.setUp()
        self.requester = ExploreRequester()
    }
    
    func testInit() {
        XCTAssertNotNil(self.requester, "Failed to load requester")
    }
}
