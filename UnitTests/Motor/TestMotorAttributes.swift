import XCTest
@testable import autoplaza

class TestMotorAttributes:XCTestCase {
    private var attributes:MotorAttributes!
    
    override func setUp() {
        super.setUp()
        self.attributes = MotorAttributes()
    }
    
    func testInit() {
        XCTAssertNotNil(self.attributes, "Failed to load attributes")
    }
}
