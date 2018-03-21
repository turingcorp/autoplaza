import XCTest
@testable import autoplaza

class TestMotor:XCTestCase {
    private var motor:Motor!
    
    override func setUp() {
        super.setUp()
        self.motor = Motor()
    }
    
    func testInit() {
        XCTAssertNotNil(self.motor, "Failed to load motor")
    }
}
