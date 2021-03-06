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
        XCTAssertNotNil(self.motor.address, "Failed to load address")
        XCTAssertNotNil(self.motor.attributes, "Failed to load attributes")
    }
}
