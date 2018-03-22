import XCTest
@testable import autoplaza

class TestSearchPaging:XCTestCase {
    private var paging:SearchPaging!
    
    override func setUp() {
        super.setUp()
        self.paging = SearchPaging()
    }
    
    func testInit() {
        XCTAssertNotNil(self.paging, "Failed to load paging")
    }
}
