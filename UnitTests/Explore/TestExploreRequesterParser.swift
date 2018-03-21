import XCTest
@testable import autoplaza

class TestExploreRequesterParser:XCTestCase {
    private var parser:ExploreRequesterParser!
    private var json:Data!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParser()
        self.json = JsonMocker.requestSearch01
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
        XCTAssertNotNil(self.json, "Failed to load json mock")
    }
    
    func testParseJson() {
        let json:Any
        do {
            try json = JSONSerialization.jsonObject(with:self.json, options:JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            return
        }
        print(json)
    }
}
