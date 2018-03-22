import XCTest
@testable import autoplaza

class TestExploreRequesterParserResults:XCTestCase {
    private var parser:ExploreRequesterParserResults!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParserResults()
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
    }
}
