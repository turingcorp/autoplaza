import UIKit

struct StructureItemExplore:StructureItemProtocol {
    let index:Int
    let controllerType:UIViewController.Type = ExploreController.self
    let navigationConfiguration:((StructureNavigatorView) -> () -> ()) = StructureNavigatorView.configureExplore
    
    init(index:Int) {
        self.index = index
    }
}
