import XCTest
@testable import autoplaza

class TestMotor:XCTestCase {
    private var motor:MotorCar!
    
    override func setUp() {
        super.setUp()
        self.motor = MotorCar()
    }
    
    func testInit() {
        XCTAssertNotNil(self.motor, "Failed to load motor")
    }
}
