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
    
    func testProperties() {
        XCTAssertNotNil(self.paging.total, "Failed to load total")
        XCTAssertNotNil(self.paging.offset, "Failed to load offset")
        XCTAssertNotNil(self.paging.limit, "Failed to load limit")
    }
}
