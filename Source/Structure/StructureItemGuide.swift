import UIKit

struct StructureItemGuide:StructureItemProtocol {
    let index:Int
    let controllerType:UIViewController.Type = GuideController.self
    let navigationConfiguration:((StructureNavigatorView) -> () -> ()) = StructureNavigatorView.configureGuide
    
    init(index:Int) {
        self.index = index
    }
}
