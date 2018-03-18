import UIKit

struct StructureItemExplore:StructureItemProtocol {
    let index:Int
    let controllerType:UIViewController.Type = ExploreController.self
    
    init(index:Int) {
        self.index = index
    }
}
