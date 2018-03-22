import XCTest
@testable import autoplaza

class TestMotorSeller:XCTestCase {
    private var seller:MotorSeller!
    
    override func setUp() {
        super.setUp()
        self.seller = MotorSeller()
    }
    
    func testInit() {
        XCTAssertNotNil(self.seller)
    }
}
