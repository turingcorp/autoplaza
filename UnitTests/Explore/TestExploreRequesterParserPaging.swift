import XCTest
@testable import autoplaza

class TestExploreRequesterParserPaging:XCTestCase {
    private var parser:ExploreRequesterParserPaging!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParserPaging()
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
    }
}
