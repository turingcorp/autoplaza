import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_Factory:XCTestCase {
    private var context:NSManagedObjectContext!
    private var bundle:Bundle!
    private var suffix:String!
    
    override func setUp() {
        super.setUp()
        self.suffix = UUID().uuidString
        self.bundle = Bundle(for:TestCoredata_Factory.self)
        self.context = Coredata.factoryContext(bundle:self.bundle, suffix:self.suffix)
    }
    
    override func tearDown() {
        super.tearDown()
        Coredata.removeStoreIn(bundle:self.bundle, suffix:self.suffix)
    }
    
    func testFactory() {
        XCTAssertNotNil(self.context, "Failed to factory context")
    }
    
    func testStoreCoordinator() {
        XCTAssertNotNil(self.context.persistentStoreCoordinator, "Context doesn't have store coordinator")
    }
    
    func testFactoryFetchRequest() {
        let fetchRequest:NSFetchRequest? = Coredata.factoryFetchRequest()
        XCTAssertNotNil(fetchRequest, "Failed to factory fetch request")
    }
    
    func testFactorySqliteFile() {
        let suffix:String = UUID().uuidString
        let file:String = Coredata.factorySqliteFile(bundle:self.bundle, suffix:suffix)
        XCTAssertNotNil(file, "Failed to factory sqlite file name")
        XCTAssertTrue(file.contains(suffix), "Failed to append suffix to sqlite name")
    }
}
