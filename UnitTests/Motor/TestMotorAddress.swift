import XCTest
@testable import autoplaza

class TestMotorAddress:XCTestCase {
    private var address:MotorAddress!
    
    override func setUp() {
        super.setUp()
        self.address = MotorAddress()
    }
    
    func testInit() {
        XCTAssertNotNil(self.address, "Failed to load motor address")
    }
}
