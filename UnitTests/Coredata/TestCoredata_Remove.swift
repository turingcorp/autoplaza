import XCTest
import CoreData
@testable import autoplaza

class TestCoredata_Remove:XCTestCase {
    private var context:NSManagedObjectContext!
    private var bundle:Bundle!
    private var suffix:String!
    private var isDataExisiting:Bool {
        get {
            let dataURL:URL = Coredata.factoryStoreURL(bundle:self.bundle, suffix:self.suffix)
            return FileManager.default.fileExists(atPath:dataURL.path)
        }
    }
    
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
    
    func testRemoveData() {
        XCTAssertTrue(self.isDataExisiting, "Data should have been created")
        
        Coredata.removeStoreIn(bundle:self.bundle, suffix:self.suffix)
        
        XCTAssertFalse(self.isDataExisiting, "Data was not removed")
    }
}
