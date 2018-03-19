import UIKit

extension StructureNavigatorView {
    func configureExplore() {
        self.titleView.updateTitle(title:String.localizedNavigation(key:"StructureNavigatorView_exploreTitle"))
        self.buttonGuide.alpha = 1
        self.buttonFilters.alpha = 1
        self.buttonFavourites.alpha = 1
        self.buttonExploreLeft.alpha = 0
        self.buttonExploreRight.alpha = 0
    }
    
    func configureGuide() {
        self.titleView.updateTitle(title:String.localizedNavigation(key:"StructureNavigatorView_guideTitle"))
        self.buttonGuide.alpha = 0
        self.buttonFilters.alpha = 0
        self.buttonFavourites.alpha = 0
        self.buttonExploreLeft.alpha = 0
        self.buttonExploreRight.alpha = 1
    }
}
