import UIKit

extension StructureController {
    func addNavigatorView() {
        let navigatorView:StructureNavigatorView = StructureNavigatorView()
        self.navigatorView = navigatorView
        
        self.view.addSubview(navigatorView)
        
        navigatorView.layoutTopToTop(view:self.view)
        navigatorView.layoutHeight(constant:Constants.navigatorViewHeight)
        navigatorView.layoutEqualsHorizontal(view:self.view)
        
        self.assignSelectors()
    }
    
    func navigateToItem(item:StructureItemProtocol) {
        let direction:UIPageViewControllerNavigationDirection = self.factoryNavigationDirectionFor(item:item)
        self.scrollTo(item:item, direction:direction, animated:true)
        self.model.selected = item
    }
    
    private func factoryNavigationDirectionFor(
        item:StructureItemProtocol) -> UIPageViewControllerNavigationDirection {
        if item.index >= self.model.selected.index {
            return UIPageViewControllerNavigationDirection.forward
        }
        return UIPageViewControllerNavigationDirection.reverse
    }
    
    func scrollTo(item:StructureItemProtocol, direction:UIPageViewControllerNavigationDirection, animated:Bool) {
        let controller:UIViewController = item.controllerType.init()
        self.updateNavigatorView(item:item)
        self.setViewControllers([controller], direction:direction, animated:animated, completion:nil)
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
