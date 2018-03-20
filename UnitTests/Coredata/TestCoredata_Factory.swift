import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_Factory:XCTestCase {
    func testFactoryContext() {
        let bundle:Bundle = Bundle(for:TestCoredata_Factory.self)
        let context:NSManagedObjectContext? = Coredata.factoryContext(bundle:bundle)
        XCTAssertNotNil(context, "Failed to factory context")
    }
}
