import XCTest
import CoreData
@testable import autoplaza

class TestCoredata:XCTestCase {
    private var coredata:Coredata!
    private var bundle:Bundle!
    private var suffix:String!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.bundle = Bundle(for:TestCoredata.self)
        self.suffix = UUID().uuidString
        self.updateContext()
    }
    
    override func tearDown() {
        super.tearDown()
        Coredata.removeStoreIn(bundle:self.bundle, suffix:self.suffix)
    }
    
    func testInit() {
        XCTAssertNotNil(self.coredata, "Failed to load Coredata")
    }
    
    func testSave() {
        self.startExpectation()
        
        self.save { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.waitExpectation()
    }
    
    func testCreate() {
        self.startExpectation()
        
        self.create(entityType:CoredataSearchConfiguration.self) { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.waitExpectation()
    }
    
    func testLoad() {
        self.startExpectation()
        
        self.create(entityType:CoredataSearchConfiguration.self) { [weak self] in
            self?.save { [weak self] in
                self?.validateAfterUpdatingContext()
            }
        }
        
        self.waitExpectation()
    }
    
    private func updateContext() {
        let context:NSManagedObjectContext = Coredata.factoryContext(bundle:self.bundle, suffix:self.suffix)
        self.coredata = Coredata(context:context)
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func create<Entity:NSManagedObject>(entityType:Entity.Type, completion:@escaping(() -> ())) {
        self.coredata.create { (configuration:Entity) in
            completion()
        }
    }
    
    private func load<Entity:NSManagedObject>(entityType:Entity.Type, completion:@escaping(([Entity]) -> ())) {
        let fetchRequest:NSFetchRequest<Entity> = Coredata.factoryFetchRequest()
        self.coredata.load(request:fetchRequest, completion:completion)
    }
    
    private func save(completion:@escaping(() -> ())) {
        self.coredata.save(completion:completion)
    }
    
    private func validateAfterUpdatingContext() {
        self.updateContext()
        self.load(
        entityType:CoredataSearchConfiguration.self) { [weak self] (entities:[CoredataSearchConfiguration]) in
            XCTAssertEqual(entities.count, 1, "Incorrect amount of entities loaded")
            self?.expect?.fulfill()
        }
    }
}
