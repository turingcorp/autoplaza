import XCTest
@testable import autoplaza

class TestExploreRequesterParserPaging:XCTestCase {
    private var parser:ExploreRequesterParserPaging!
    private var jsonSuccess:Data!
    private var jsonError:Data!
    private var dictionarySuccess:[String:Any]!
    private var dictionaryError:[String:Any]!
    private struct Constants {
        static let total:Int = 110690
        static let offset:Int = 33
        static let limit:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        let jsonParser:ExploreRequesterParser = ExploreRequesterParser()
        self.parser = ExploreRequesterParserPaging()
        self.jsonSuccess = JsonMocker.paging01
        self.jsonError = JsonMocker.pagingError01
        
        do {
            try self.dictionarySuccess = jsonParser.getJsonFrom(data:self.jsonSuccess)
            try self.dictionaryError = jsonParser.getJsonFrom(data:self.jsonError)
        } catch {}
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
        XCTAssertNotNil(self.jsonSuccess, "Failed to load json success")
        XCTAssertNotNil(self.jsonError, "Failed to load json error")
        XCTAssertNotNil(self.dictionarySuccess, "Failed to load dictionary success")
        XCTAssertNotNil(self.dictionaryError, "Failed to load dictionary error")
    }
    
    func testThrowErrorOnWrongJson() {
        XCTAssertThrowsError(try self.parser.parse(json:self.dictionaryError))
    }
    
    func testNotThrowOnSuccess() {
        XCTAssertNoThrow(try self.parser.parse(json:self.dictionarySuccess))
    }
    
    func testParsingValues() {
        let paging:SearchPaging
        do {
            try paging = self.parser.parse(json:self.dictionarySuccess)
        } catch {
            return
        }
        print(self.dictionarySuccess)
        XCTAssertEqual(paging.total, Constants.total, "Total not parsed properly")
        XCTAssertEqual(paging.limit, Constants.limit, "Limit not parsed properly")
        XCTAssertEqual(paging.offset, Constants.offset, "Offset not parsed properly")
    }
}
