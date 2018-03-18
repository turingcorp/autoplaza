import XCTest
@testable import autoplaza

class TestStructureNavigatorViewButton:XCTestCase {
    private var button:StructureNavigatorViewButton!
    private struct Constants {
        static let title:String = "button"
    }
    
    override func setUp() {
        super.setUp()
        let image:UIImage = UIImage()
        self.button = StructureNavigatorViewButton(image:image, title:Constants.title)
    }
    
    func testInit() {
        XCTAssertNotNil(self.button, "Failed to load button")
        XCTAssertNotNil(self.button.image(for:UIControlState.normal), "failed to assign image")
        XCTAssertEqual(self.button.titleView.text, Constants.title, "failed to assign title")
    }
}
