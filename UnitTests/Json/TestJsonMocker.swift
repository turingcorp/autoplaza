import XCTest

class TestJsonMocker:XCTestCase {
    private var json:Data!
    
    override func setUp() {
        super.setUp()
        self.json = JsonMocker.requestSearch01
    }
    
    func testLoading() {
        XCTAssertNotNil(self.json, "Failed to load json")
    }
    
    func testAsString() {
        let string:String? = String(data:self.json, encoding:String.Encoding.utf8)
        XCTAssertNotNil(string, "Json cannot be parsed to string")
    }
}
