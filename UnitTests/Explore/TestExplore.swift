import XCTest
@testable import autoplaza

class TestExplore:XCTestCase {
    private var explore:Explore!
    private var searchConfigurationLoader:MockExploreSearchConfigurationLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.explore = Explore()
        self.searchConfigurationLoader = MockExploreSearchConfigurationLoader()
    }
    
    func testInit() {
        XCTAssertNotNil(self.explore, "Failed to load explore")
        XCTAssertNotNil(self.explore.requester, "Failed to load requester")
        XCTAssertNotNil(self.explore.motors, "Failed to load motors")
    }
    
    func testLoadSearchConfiguration() {
        self.startExpectation()
        self.loadSearchConfiguration()
        self.waitExpectation()
    }
    
    func testMotors() {
        XCTAssertEqual(self.explore.motors.count, 0, "There should be 0 motors")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func loadSearchConfiguration() {
        let currentConfiguration:SearchConfiguration = self.explore.searchConfiguration
        self.explore.loadSearchConfiguration(
        searchConfigurationLoader:self.searchConfigurationLoader) { [weak self] in
            self?.compareConfigurations(previous:currentConfiguration)
            self?.expect?.fulfill()
        }
    }
    
    private func compareConfigurations(previous:SearchConfiguration) {
        XCTAssertFalse(previous === self.explore.searchConfiguration, "Configuration didn't change")
    }
}
