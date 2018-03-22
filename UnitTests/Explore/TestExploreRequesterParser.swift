import XCTest
@testable import autoplaza

class TestExploreRequesterParser:XCTestCase {
    private var parser:ExploreRequesterParser!
    private var json:Data!
    private var jsonEmpty:Data!
    private var jsonEmptyDictionary:Data!
    private struct Constants {
        static let pagingTotal:Int = 110690
        static let pagingOffset:Int = 33
        static let pagingLimit:Int = 1
    }
    
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
        XCTAssertEqual(response.paging.limit, Constants.pagingLimit, "Limit not parsed properly")
        XCTAssertEqual(response.paging.offset, Constants.pagingOffset, "Offset not parsed properly")
        XCTAssertEqual(response.paging.total, Constants.pagingTotal, "Total not parsed properly")
    }
}
