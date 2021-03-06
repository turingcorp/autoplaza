import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_SearchConfiguration:XCTestCase {
    private var coredata:Coredata!
    private var bundle:Bundle!
    private var suffix:String!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 500
    }
    
    override func setUp() {
        super.setUp()
        self.suffix = UUID().uuidString
        self.bundle = Bundle(for:TestCoredata.self)
        let context:NSManagedObjectContext = Coredata.factoryContext(bundle:bundle, suffix:self.suffix)
        self.coredata = Coredata(context:context)
    }
    
    override func tearDown() {
        super.tearDown()
        Coredata.removeStoreIn(bundle:self.bundle, suffix:self.suffix)
    }
    
    func testInit() {
        XCTAssertNotNil(self.coredata, "Failed to load Coredata")
    }
    
    func testLoadSearchConfiguration() {
        self.startExpectation()
        
        self.loadSearchConfiguration()
        
        self.waitExpectation()
    }
    
    func testLoadCoredataSearchConfiguration() {
        self.startExpectation()
        
        self.createCoredataSearchConfiguration { [weak self] in
            self?.loadCoredataSearchConfiguration()
        }
        
        self.waitExpectation()
    }
    
    func testCreateCoredataSearchConfiguration() {
        self.startExpectation()
        
        self.createCoredataSearchConfiguration { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.waitExpectation()
    }
    
    private func loadSearchConfiguration() {
        self.coredata.loadSearchConfiguration { [weak self] (searchConfiguration:SearchConfiguration) in
            self?.expect?.fulfill()
        }
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func createCoredataSearchConfiguration(completion:@escaping(() -> ())) {
        self.coredata.createCoredataSearchConfiguration { (configuration:CoredataSearchConfiguration) in
            completion()
        }
    }
    
    private func loadCoredataSearchConfiguration() {
        self.coredata.loadCoredataSearchConfiguration(
            found: { [weak self] (configuration:CoredataSearchConfiguration) in
                self?.expect?.fulfill()
            }, notFound: { })
    }
}
