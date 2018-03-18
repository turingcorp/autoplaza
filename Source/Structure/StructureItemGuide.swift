import UIKit

struct StructureItemGuide:StructureItemProtocol {
    let index:Int
    let controllerType:UIViewController.Type = GuideController.self
    
    init(index:Int) {
        self.index = index
    }
}
