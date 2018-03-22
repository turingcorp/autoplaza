import XCTest
@testable import autoplaza

class TestFiltersItemConditionNew:XCTestCase {
    private var condition:FiltersItemConditionNew!
    
    override func setUp() {
        super.setUp()
        self.condition = FiltersItemConditionNew()
    }
    
    func testInit() {
        XCTAssertNotNil(self.condition, "Failed to load filter")
    }
}
