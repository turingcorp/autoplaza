import XCTest
@testable import autoplaza

class TestMotorCar:XCTestCase {
    private var motor:MotorCar!
    
    override func setUp() {
        super.setUp()
        self.motor = MotorCar()
    }
    
    func testInit() {
        XCTAssertNotNil(self.motor, "Failed to load motor")
        XCTAssertNotNil(self.motor.seller, "Failed to load seller")
    }
}
