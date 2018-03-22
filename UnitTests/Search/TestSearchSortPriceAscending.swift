import XCTest
@testable import autoplaza

class TestSearchSortPriceAscending:XCTestCase {
    private var sort:SearchSortPriceAscending!
    
    override func setUp() {
        super.setUp()
        self.sort = SearchSortPriceAscending()
    }
    
    func testInit() {
        XCTAssertNotNil(self.sort, "Failed to load sort")
    }
}
