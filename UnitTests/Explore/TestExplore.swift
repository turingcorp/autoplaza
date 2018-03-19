import XCTest
@testable import autoplaza

class TestExplore:XCTestCase {
    private var explore:Explore!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.explore = Explore()
    }
    
    func testInit() {
        XCTAssertNotNil(self.explore, "Failed to load explore")
    }
    
    func testLoadFilters() {
        self.startExpectation()
        self.loadFilters()
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func loadFilters() {
        self.explore.loadSearchConfiguration { [weak self] in
            XCTAssertNotNil(self?.explore.searchConfiguration, "Failed to load search configuration")
            self?.expect?.fulfill()
        }
    }
}
