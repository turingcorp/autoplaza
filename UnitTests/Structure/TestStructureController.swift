import XCTest
@testable import autoplaza

class TestStructureController:XCTestCase {
    private var controller:StructureController!
    
    override func setUp() {
        super.setUp()
        self.controller = StructureController()
    }
    
    func testInit() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
    }
    
    func testNavigationView() {
        XCTAssertNotNil(self.controller.view, "Failed loading controller view")
        XCTAssertNotNil(self.controller.navigationView, "Failed to load navigation view")
    }
    
    func testScroll() {
        let item:StructureItemExplore = StructureItemExplore(index:0)
        self.scrollToItem(item:item)
        XCTAssertNotNil(self.controller.childViewControllers.first, "Failed to move to controller")
    }
    
    func testChangeController() {
        let item:StructureItemExplore = StructureItemExplore(index:0)
        self.scrollToItem(item:item)
        self.validateCurrentControllerIs(controllerType:item.controllerType)
    }
    
    private func scrollToItem(item:StructureItemProtocol) {
        self.controller.scrollTo(
            item:item,
            direction:UIPageViewControllerNavigationDirection.forward,
            animated:false)
    }
    
    private func validateCurrentControllerIs<ControllerType:UIViewController>(controllerType:ControllerType.Type) {
        guard
            let controller:UIViewController = self.controller.childViewControllers.first
        else {
            return
        }
        let currentType:ControllerType.Type? = type(of:controller) as? ControllerType.Type
        XCTAssertNotNil(currentType, "Controller doesn't match type")
    }
}
