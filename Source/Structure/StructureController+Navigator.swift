import UIKit

extension StructureController {
    func addNavigatorView() {
        let navigatorView:StructureNavigatorView = StructureNavigatorView()
        self.navigatorView = navigatorView
        
        self.view.addSubview(navigatorView)
        
        navigatorView.layoutTopToTop(view:self.view)
        navigatorView.layoutHeight(constant:Constants.navigatorViewHeight)
        navigatorView.layoutEqualsHorizontal(view:self.view)
    }
    
    func scrollTo(item:StructureItemProtocol, direction:UIPageViewControllerNavigationDirection, animated:Bool) {
        let controller:UIViewController = item.controllerType.init()
        self.setViewControllers([controller], direction:direction, animated:animated, completion:nil)
        self.updateNavigatorView(item:item)
    }
    
    private func updateNavigatorView(item:StructureItemProtocol) {
        UIView.animate(withDuration:Constants.animationDuration) { [weak self] in
            guard
                let navigatorView:StructureNavigatorView = self?.navigatorView
            else {
                return
            }
            item.navigationConfiguration(navigatorView)()
        }
    }
}
