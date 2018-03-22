import XCTest
@testable import autoplaza

class TestJsonPaging:XCTestCase {
    private var paging:JsonPaging!
    
    override func setUp() {
        super.setUp()
        self.paging = JsonPaging()
    }
    
    func testInit() {
        XCTAssertNotNil(self.paging, "Failed to load paging")
    }
}
