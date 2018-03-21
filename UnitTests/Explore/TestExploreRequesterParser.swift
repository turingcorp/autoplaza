import XCTest
@testable import autoplaza

class TestExploreRequesterParser:XCTestCase {
    private var parser:ExploreRequesterParser!
    
    override func setUp() {
        super.setUp()
        self.parser = ExploreRequesterParser()
    }
    
    func testInit() {
        XCTAssertNotNil(self.parser, "Failed to load parser")
    }
}
