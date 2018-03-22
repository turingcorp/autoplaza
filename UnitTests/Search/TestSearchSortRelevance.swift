import XCTest
@testable import autoplaza

class TestSearchSortRelevance:XCTestCase {
    private var sort:SearchSortRelevance!
    
    override func setUp() {
        super.setUp()
        self.sort = SearchSortRelevance()
    }
    
    func testInit() {
        XCTAssertNotNil(self.sort, "Failed to load sort")
    }
}
