import XCTest
@testable import autoplaza

class TestExploreRequester_Factory:XCTestCase {
    func testFactory() {
        let session:URLSession = ExploreRequester.factorySession()
        XCTAssertNotNil(session, "Failed to factory session")
    }
}
