import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_Factory:XCTestCase {
    private var context:NSManagedObjectContext!
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestCoredata_Factory.self)
        self.context = Coredata.factoryContext(bundle:bundle)
    }
    
    func testFactory() {
        XCTAssertNotNil(self.context, "Failed to factory context")
    }
    
    func testStoreCoordinator() {
        XCTAssertNotNil(self.context.persistentStoreCoordinator, "Context doesn't have store coordinator")
    }
}
