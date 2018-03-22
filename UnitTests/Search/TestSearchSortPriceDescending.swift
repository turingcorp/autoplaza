import XCTest
@testable import autoplaza

class TestSearchSortPriceDescending:XCTestCase {
    private var sort:SearchSortPriceDescending!
    
    override func setUp() {
        super.setUp()
        self.sort = SearchSortPriceDescending()
    }
    
    func testInit() {
        XCTAssertNotNil(self.sort, "Failed to load sort")
    }
}
