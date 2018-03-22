import XCTest
@testable import autoplaza

class TestFiltersItemConditionUsed:XCTestCase {
    private var condition:FiltersItemConditionUsed!
    
    override func setUp() {
        super.setUp()
        self.condition = FiltersItemConditionUsed()
    }
    
    func testInit() {
        XCTAssertNotNil(self.condition, "Failed to load condition")
    }
}
