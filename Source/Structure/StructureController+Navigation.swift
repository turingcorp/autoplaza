import UIKit

extension StructureController {
    func addNavigationView() {
        let navigationView:StructureNavigatorView = StructureNavigatorView()
        self.navigationView = navigationView
        
        self.view.addSubview(navigationView)
        
        navigationView.layoutTopToTop(view:self.view)
        navigationView.layoutHeight(constant:Constants.navigationViewHeight)
        navigationView.layoutEqualsHorizontal(view:self.view)
    }
    
    func scrollTo(item:StructureItemProtocol, direction:UIPageViewControllerNavigationDirection, animated:Bool) {
        let controller:UIViewController = item.controllerType.init()
        self.setViewControllers([controller], direction:direction, animated:animated, completion:nil)
    }
}
