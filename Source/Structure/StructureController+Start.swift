import UIKit

extension StructureController {
    func start() {
        self.addNavigationView()
        self.showInitialItem()
    }
    
    private func showInitialItem() {
        let item:StructureItemProtocol = self.model.items[Structure.Constants.initialIndex]
        self.scrollTo(item:item, direction:UIPageViewControllerNavigationDirection.forward, animated:false)
    }
}
