import XCTest
@testable import autoplaza

class TestMotorAttributesItemYear:XCTestCase {
    private var year:MotorAttributesItemYear!
    private struct Constants {
        static let year:Int = 1999
        static let wrongYear:String = "h"
        static let emptyYear:String = ""
        static let invalidYear:String = "1920"
    }
    
    override func setUp() {
        super.setUp()
        let value:String = String(Constants.year)
        self.year = MotorAttributesItemYear(value:value)
    }
    
    func testInit() {
        XCTAssertNotNil(self.year, "Failed to load year")
        XCTAssertNotNil(self.year.name, "Failed to load name")
        XCTAssertNotNil(self.year.year, "Failed to load year")
        XCTAssertNotNil(MotorAttributesItemYear.identifier, "Failed to load identifier")
    }
    
    func testParserYearCorrectly() {
        XCTAssertEqual(self.year.year, Constants.year, "Failed to parse year value")
    }
    
    func testFailedInitDueToWrongValue() {
        let year:MotorAttributesItemYear? = MotorAttributesItemYear(value:Constants.wrongYear)
        XCTAssertNil(year, "Item should not be created when value is wrong")
    }
    
    func testFailedInitDueToEmptyValue() {
        let year:MotorAttributesItemYear? = MotorAttributesItemYear(value:Constants.emptyYear)
        XCTAssertNil(year, "Item should not be created when value is empty")
    }
    
    func testFailedInitDueToInvalidValue() {
        let year:MotorAttributesItemYear? = MotorAttributesItemYear(value:Constants.invalidYear)
        XCTAssertNil(year, "Item should not be created when value is invalid")
    }
}
