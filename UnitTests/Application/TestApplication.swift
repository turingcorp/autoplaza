import XCTest
@testable import autoplaza

class TestApplication:XCTestCase {
    private var application:Application?
    
    override func setUp() {
        super.setUp()
        self.application = Application()
    }
    
    func testInit() {
        XCTAssertNotNil(self.application, "Failed to load application")
    }
    
    func testDidFinishLaunching() {
        let _:Bool? = self.application?.application(UIApplication.shared, didFinishLaunchingWithOptions:nil)
        XCTAssertNotNil(self.application?.window, "Failed to create window")
        XCTAssertNotNil(self.application?.window?.rootViewController, "Failed to create root view controller")
    }
}
