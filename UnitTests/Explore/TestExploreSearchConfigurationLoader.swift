import XCTest
@testable import autoplaza

class TestExploreSearchConfigurationLoader:XCTestCase {
    private var loader:ExploreSearchConfigurationLoader!
    
    override func setUp() {
        super.setUp()
        self.loader = ExploreSearchConfigurationLoader()
    }
    
    func testInit() {
        XCTAssertNotNil(self.loader, "Failed to create loader")
    }
}
