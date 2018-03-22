import XCTest
@testable import autoplaza

class TestExploreRequesterParser:XCTestCase {
    private var parser:ExploreRequesterParser!
    private var json:Data!
    private var jsonEmpty:Data!
    private var jsonEmptyDictionary:Data!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParser()
        self.json = JsonMocker.requestSearch01
        self.jsonEmpty = JsonMocker.empty
        self.jsonEmptyDictionary = JsonMocker.emptyDictionary
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
        XCTAssertNotNil(self.json, "Failed to load json mock")
    }
    
    func testParseNoThrow() {
        XCTAssertNoThrow(try self.parser.parse(data:self.json), "Failed to parse json")
    }
    
    func testParseEmptyThrow() {
        XCTAssertThrowsError(try self.parser.parse(data:self.jsonEmpty), "Should throw an error")
    }
    
    func testParseEmptyDictionaryThrow() {
        XCTAssertThrowsError(try self.parser.parse(data:self.jsonEmptyDictionary), "Should throw an error")
    }
    
    func testResponsePaging() {
        let response:SearchResponse
        do {
            try response = self.parser.parse(data:self.json)
        } catch {
            return
        }
        XCTAssertNotNil(response.paging, "Response doesn't have paging")
    }
}
