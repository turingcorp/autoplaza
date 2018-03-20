import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_Factory:XCTestCase {
    private var context:NSManagedObjectContext!
    private var bundle:Bundle!
    private var isDataExisiting:Bool {
        get {
            let dataURL:URL = Coredata.factoryStoreURL(bundle:self.bundle)
            return FileManager.default.fileExists(atPath:dataURL.path)
        }
    }
    override func setUp() {
        super.setUp()
        self.bundle = Bundle(for:TestCoredata_Factory.self)
        self.context = Coredata.factoryContext(bundle:self.bundle)
    }
    
    override func tearDown() {
        super.tearDown()
        Coredata.removeStoreIn(bundle:self.bundle)
    }
    
    func testFactory() {
        XCTAssertNotNil(self.context, "Failed to factory context")
    }
    
    func testStoreCoordinator() {
        XCTAssertNotNil(self.context.persistentStoreCoordinator, "Context doesn't have store coordinator")
    }
    
    func testRemoveData() {
        XCTAssertTrue(self.isDataExisiting, "Data should have been created")
        
        Coredata.removeStoreIn(bundle:self.bundle)
        
        XCTAssertFalse(self.isDataExisiting, "Data was not removed")
    }
}
