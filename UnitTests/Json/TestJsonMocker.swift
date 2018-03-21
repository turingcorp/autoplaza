import XCTest

class TestJsonMocker:XCTestCase {
    private var json:Data!
    private var jsonEmpty:Data!
    private var jsonEmptyDictionary:Data!
    
    override func setUp() {
        super.setUp()
        self.json = JsonMocker.requestSearch01
        self.jsonEmpty = JsonMocker.empty
        self.jsonEmptyDictionary = JsonMocker.emptyDictionary
    }
    
    func testLoading() {
        XCTAssertNotNil(self.json, "Failed to load json")
        XCTAssertNotNil(self.jsonEmpty, "Failed to load json empty")
        XCTAssertNotNil(self.jsonEmptyDictionary, "Failed to load json empty dictionary")
    }
    
    func testAsString() {
        let string:String? = String(data:self.json, encoding:String.Encoding.utf8)
        XCTAssertNotNil(string, "Json cannot be parsed to string")
    }
}
