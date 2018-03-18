import Foundation

extension StructureController {
    func addNavigationView() {
        let navigationView:StructureNavigatorView = StructureNavigatorView()
        self.navigationView = navigationView
        
        self.view.addSubview(navigationView)
        
        navigationView.layoutTopToTop(view:self.view)
        navigationView.layoutHeight(constant:Constants.navigationViewHeight)
        navigationView.layoutEqualsHorizontal(view:self.view)
    }
}
