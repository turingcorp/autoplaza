import XCTest
@testable import autoplaza

class TestExploreRequester_Factory:XCTestCase {
    private var configuration:SearchConfiguration!
    
    override func setUp() {
        super.setUp()
        self.configuration = SearchConfiguration.factoryBaseConfiguration()
    }
    
    func testFactorySession() {
        let session:URLSession = ExploreRequester.factorySession()
        XCTAssertNotNil(session, "Failed to factory session")
    }
    
    func testFactoryRequest() {
        let request:URLRequest = ExploreRequester.factoryRequest(configuration:self.configuration)
        XCTAssertNotNil(request, "Failed to factory request")
    }
}
