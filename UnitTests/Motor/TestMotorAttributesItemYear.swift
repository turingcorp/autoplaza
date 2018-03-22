import XCTest
@testable import autoplaza

class TestMotorAttributesItemYear:XCTestCase {
    private var year:MotorAttributesItemYear!
    
    override func setUp() {
        super.setUp()
        self.year = MotorAttributesItemYear()
    }
    
    func testInit() {
        XCTAssertNotNil(self.year, "Failed to load year")
    }
}
