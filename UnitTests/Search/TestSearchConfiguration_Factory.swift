import XCTest
@testable import autoplaza

class TestSearchConfiguration_Factory:XCTestCase {
    func testFactory() {
        let configuration:SearchConfiguration = SearchConfiguration.factoryBaseConfiguration()
        XCTAssertNotNil(configuration, "Failed to factory configuration")
    }
}
