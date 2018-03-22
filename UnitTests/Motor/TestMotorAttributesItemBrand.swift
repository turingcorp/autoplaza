import XCTest
@testable import autoplaza

class TestMotorAttributesItemBrand:XCTestCase {
    private var brand:MotorAttributesItemBrand!
    private struct Constants {
        static let name:String = "Lorem ipsum"
        static let invalidName:String = " "
        static let emptyName:String = ""
    }
    
    override func setUp() {
        super.setUp()
        self.brand = MotorAttributesItemBrand(value:Constants.name)
    }
    
    func testInit() {
        XCTAssertNotNil(self.brand, "Failed to create brand")
    }
    
    func testFailInitWithInvalidName() {
        let brand:MotorAttributesItemBrand? = MotorAttributesItemBrand(value:Constants.invalidName)
        XCTAssertNil(brand, "Brand should not be created with invalid name")
    }
    
    func testFailInitWithEmptyName() {
        let brand:MotorAttributesItemBrand? = MotorAttributesItemBrand(value:Constants.emptyName)
        XCTAssertNil(brand, "Brand should not be created with empty name")
    }
}
