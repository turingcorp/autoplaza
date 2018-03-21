import XCTest
@testable import autoplaza

class TestCoredataSearchConfiguration_Factory:XCTestCase {
    private var searchConfiguration:CoredataSearchConfiguration!
    
    override func setUp() {
        super.setUp()
        self.searchConfiguration = CoredataSearchConfiguration()
    }
    
    func testInit() {
        XCTAssertNotNil(self.searchConfiguration, "Failed to load search configuration")
    }
    
    func testFactory() {
        let configuration:SearchConfiguration? = self.searchConfiguration.factoryConfiguration()
        XCTAssertNotNil(configuration, "Failed to factory configuration")
    }
}
