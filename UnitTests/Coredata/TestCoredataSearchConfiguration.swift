import XCTest
@testable import autoplaza

class TestCoredataSearchConfiguration: XCTestCase {
    private var searchConfiguration:CoredataSearchConfiguration!
    
    override func setUp() {
        super.setUp()
        self.searchConfiguration = CoredataSearchConfiguration()
    }
    
    func testInit() {
        XCTAssertNotNil(self.searchConfiguration, "Failed to load search configuration")
    }
}
