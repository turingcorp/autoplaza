import UIKit

class StructureNavigatorView:UIView {
    private(set) var titleView:UILabel!
    private(set) var buttonFavourites:StructureNavigatorViewButton!
    private(set) var buttonFilters:StructureNavigatorViewButton!
    private(set) var buttonGuide:StructureNavigatorViewButton!
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedGrayColour
        self.translatesAutoresizingMaskIntoConstraints = false
        self.factoryButtons()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func factoryButtons() {
        let titleView:UILabel = UILabel()
        titleView.isUserInteractionEnabled = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor.clear
        titleView.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.medium)
        titleView.textColor = UIColor.black
        titleView.textAlignment = NSTextAlignment.center
        titleView.text = String.localizedNavigation(key:"StructureItemExplore_title")
        self.titleView = titleView
        
        let buttonFavourites:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetFavourites"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonFavourites"))
        self.buttonFavourites = buttonFavourites
        
        let buttonFilters:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetFilters"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonFilters"))
        self.buttonFilters = buttonFilters
        
        let buttonGuide:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetGuide"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonGuide"))
        self.buttonGuide = buttonGuide
        
        let borderView:UIView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = UIColor.black
        borderView.isUserInteractionEnabled = false
        
        self.addSubview(buttonFavourites)
        self.addSubview(buttonFilters)
        self.addSubview(buttonGuide)
        self.addSubview(titleView)
        self.addSubview(borderView)
        
        buttonFavourites.layoutEqualsVertical(view:self)
        buttonFavourites.layoutRightToRight(view:self)
        buttonFavourites.layoutWidth(constant:Constants.favouritesWidth)
        
        buttonFilters.layoutEqualsVertical(view:self)
        buttonFilters.layoutRightToLeft(view:buttonFavourites)
        buttonFilters.layoutWidth(constant:Constants.filtersWidth)
        
        buttonGuide.layoutEqualsVertical(view:self)
        buttonGuide.layoutLeftToLeft(view:self)
        buttonGuide.layoutWidth(constant:Constants.guideWidth)
        
        titleView.layoutTopToTop(view:self, constant:Constants.titleTop)
        titleView.layoutBottomToBottom(view:self)
        titleView.layoutEqualsHorizontal(view:self)
        
        borderView.layoutHeight(constant:1)
        borderView.layoutBottomToBottom(view:self)
        borderView.layoutEqualsHorizontal(view:self)
    }
}
