import UIKit

extension StructureController {
    func assignSelectors() {
        self.navigatorView.buttonGuide.addTarget(
            self,
            action:#selector(self.selectorGuide(sender:)),
            for:UIControlEvents.touchUpInside)
        self.navigatorView.buttonExploreLeft.addTarget(
            self,
            action:#selector(self.selectorExplore(sender:)),
            for:UIControlEvents.touchUpInside)
        self.navigatorView.buttonExploreRight.addTarget(
            self,
            action:#selector(self.selectorExplore(sender:)),
            for:UIControlEvents.touchUpInside)
        self.navigatorView.buttonFilters.addTarget(
            self,
            action:#selector(self.selectorFilters(sender:)),
            for:UIControlEvents.touchUpInside)
        self.navigatorView.buttonFavourites.addTarget(
            self,
            action:#selector(self.selectorFavourites(sender:)),
            for:UIControlEvents.touchUpInside)
    }
    
    @objc
    private func selectorGuide(sender button:UIButton) {
        guard
            let item:StructureItemProtocol = self.model.itemFor(itemType:StructureItemGuide.self)
        else {
            return
        }
        self.navigateToItem(item:item)
    }
    
    @objc
    private func selectorExplore(sender button:UIButton) {
        guard
            let item:StructureItemProtocol = self.model.itemFor(itemType:StructureItemExplore.self)
        else {
            return
        }
        self.navigateToItem(item:item)
    }
    
    @objc
    private func selectorFilters(sender button:UIButton) {
        
    }
    
    @objc
    private func selectorFavourites(sender button:UIButton) {
        
    }
}
