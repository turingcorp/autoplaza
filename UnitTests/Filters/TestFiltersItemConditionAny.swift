import XCTest
@testable import autoplaza

class TestFiltersItemConditionAny:XCTestCase {
    private var condition:FiltersItemConditionAny!
    
    override func setUp() {
        super.setUp()
        self.condition = FiltersItemConditionAny()
    }
    
    func testInit() {
        XCTAssertNotNil(self.condition, "Failed to load condition")
    }
}
