import XCTest
@testable import autoplaza

class TestSearchResponse:XCTestCase {
    private var response:SearchResponse!
    
    override func setUp() {
        super.setUp()
        self.response = SearchResponse()
    }
    
    func testInit() {
        XCTAssertNotNil(self.response, "Failed to load search response")
    }
}
