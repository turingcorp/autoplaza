import XCTest
@testable import autoplaza

class TestSearchConfiguration:XCTestCase {
    private var configuration:SearchConfiguration!
    
    override func setUp() {
        super.setUp()
        self.configuration = SearchConfiguration.factoryBasic()
    }
    
    func testInit() {
        XCTAssertNotNil(self.configuration, "Failed to load configuration")
    }
}
