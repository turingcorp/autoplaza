import XCTest
@testable import autoplaza

class TestCoredata:XCTestCase {
    private var coredata:Coredata!
    
    override func setUp() {
        super.setUp()
        self.coredata = Coredata()
    }
    
    func testInit() {
        XCTAssertNotNil(self.coredata, "Failed to load coredata")
    }
}
