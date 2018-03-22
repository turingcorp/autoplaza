import XCTest
@testable import autoplaza

class TestExploreRequesterParserResults:XCTestCase {
    private var parser:ExploreRequesterParserResults!
    private var json:Data!
    private var jsonError:Data!
    private var dictionary:[String:Any]!
    private var dictionaryError:[String:Any]!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParserResults()
        self.json = JsonMocker.results01
        self.jsonError = JsonMocker.resultsError01
        let jsonParser:ExploreRequesterParser = ExploreRequesterParser()
        do {
            try self.dictionary = jsonParser.getJsonFrom(data:self.json)
            try self.dictionaryError = jsonParser.getJsonFrom(data:self.jsonError)
        } catch { }
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
        XCTAssertNotNil(self.json, "Failed to load json")
        XCTAssertNotNil(self.jsonError, "Failed to load json error")
        XCTAssertNotNil(self.dictionary, "Failed to load dictionary")
        XCTAssertNotNil(self.dictionaryError, "Failed to load dictionary with error")
    }
    
    func testParsingWrongDictionaryShouldThrow() {
        XCTAssertThrowsError(try self.parser.parse(json:self.dictionaryError),
                             "Parser should throw an error when dictionary is wrong")
    }
    
    func testParsingShouldNoThrow() {
        XCTAssertNoThrow(try self.parser.parse(json:self.dictionary), "Parser should not throw on parsing")
    }
    
    
}
