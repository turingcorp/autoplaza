import XCTest
@testable import autoplaza

class TestStructureNavigatorView:XCTestCase {
    private var view:StructureNavigatorView!
    
    override func setUp() {
        super.setUp()
        self.view = StructureNavigatorView()
    }
    
    func testInit() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.buttonFavourites, "Failed to load button favourites")
        XCTAssertNotNil(self.view.buttonFilters, "Failed to load button filters")
        XCTAssertNotNil(self.view.buttonGuide, "Failed to load button guide")
        XCTAssertNotNil(self.view.buttonExploreLeft, "Failed to load button explore left")
        XCTAssertNotNil(self.view.buttonExploreRight, "Failed to load button explore right")
        XCTAssertNotNil(self.view.titleView, "Failed to load title")
    }
}
