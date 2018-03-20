import XCTest
import CoreData
@testable import autoplaza

class TestCoredata:XCTestCase {
    private var coredata:Coredata!
    private var bundle:Bundle!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.bundle = Bundle(for:TestCoredata.self)
        let context:NSManagedObjectContext = Coredata.factoryContext(bundle:bundle)
        self.coredata = Coredata(context:context)
    }
    
    override func tearDown() {
        super.tearDown()
        Coredata.removeStoreIn(bundle:self.bundle)
    }
    
    func testInit() {
        XCTAssertNotNil(self.coredata, "Failed to load Coredata")
    }
}
