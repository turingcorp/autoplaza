import XCTest
@testable import autoplaza

class TestExploreRequester:XCTestCase {
    private var requester:ExploreRequester!
    private var configuration:SearchConfiguration!
    private var session:MockURLSessionExplore!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let waitingForExpectation:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.session = MockURLSessionExplore()
        self.requester = ExploreRequester(session:self.session)
        self.configuration = SearchConfiguration.factoryBaseConfiguration()
    }
    
    func testInit() {
        XCTAssertNotNil(self.requester, "Failed to load requester")
        XCTAssertNotNil(self.requester.session, "Failed to load session")
        XCTAssertNotNil(self.requester.parser, "Failed to load parser")
        XCTAssertNotNil(self.session, "Failed to load session")
    }
    
    func testLoadMotors() {
        self.startExpectation()
        
        self.loadMotors { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.waitingForExpectation) { (error:Error?) in }
    }
    
    private func loadMotors(completion:@escaping(() -> ())) {
        self.requester.loadMotors(configuration:self.configuration, success: { (motors:[MotorProtocol]) in
            completion()
        }, error: { (error:Error) in })
    }
}
