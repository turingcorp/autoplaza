import XCTest
@testable import autoplaza

class TestExploreSearchConfigurationLoader:XCTestCase {
    private var loader:ExploreSearchConfigurationLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.loader = ExploreSearchConfigurationLoader()
    }
    
    func testInit() {
        XCTAssertNotNil(self.loader, "Failed to create loader")
    }
    
    func testLoad() {
        self.startExpectation()
        self.loader.load { [weak self] (configuration:SearchConfiguration) in
            self?.expect?.fulfill()
        }
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = XCTestExpectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
}
