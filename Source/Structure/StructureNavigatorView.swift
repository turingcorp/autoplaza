import UIKit

class StructureNavigatorView:UIView {
    private(set) var titleView:UILabel!
    private(set) var buttonFavourites:StructureNavigatorViewButton!
    private(set) var buttonFilters:StructureNavigatorViewButton!
    private(set) var buttonGuide:StructureNavigatorViewButton!
    private(set) var buttonExploreLeft:StructureNavigatorViewButton!
    private(set) var buttonExploreRight:StructureNavigatorViewButton!
    
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
        titleView.text = String.localizedNavigation(key:"StructureNavigatorView_title")
        self.titleView = titleView
        
        let buttonFavourites:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetFavourites"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonFavourites"))
        buttonFavourites.isHidden = true
        self.buttonFavourites = buttonFavourites
        
        let buttonFilters:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetFilters"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonFilters"))
        buttonFilters.isHidden = true
        self.buttonFilters = buttonFilters
        
        let buttonGuide:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetGuide"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonGuide"))
        buttonGuide.isHidden = true
        self.buttonGuide = buttonGuide
        
        let buttonExploreLeft:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetExplore"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonExplore"))
        buttonExploreLeft.isHidden = true
        self.buttonExploreLeft = buttonExploreLeft
        
        let buttonExploreRight:StructureNavigatorViewButton = StructureNavigatorViewButton(
            image:#imageLiteral(resourceName: "assetExplore"),
            title:String.localizedNavigation(key:"StructureNavigatorView_buttonExplore"))
        buttonExploreRight.isHidden = true
        self.buttonExploreRight = buttonExploreRight
        
        let borderView:UIView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = UIColor.black
        borderView.isUserInteractionEnabled = false
        
        self.addSubview(buttonFavourites)
        self.addSubview(buttonFilters)
        self.addSubview(buttonGuide)
        self.addSubview(buttonExploreLeft)
        self.addSubview(buttonExploreRight)
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
        
        buttonExploreLeft.layoutEqualsVertical(view:self)
        buttonExploreLeft.layoutLeftToLeft(view:self)
        buttonExploreLeft.layoutWidth(constant:Constants.exploreWidth)
        
        buttonExploreRight.layoutEqualsVertical(view:self)
        buttonExploreRight.layoutRightToRight(view:self)
        buttonExploreRight.layoutWidth(constant:Constants.exploreWidth)
        
        titleView.layoutTopToTop(view:self, constant:Constants.titleTop)
        titleView.layoutBottomToBottom(view:self)
        titleView.layoutEqualsHorizontal(view:self)
        
        borderView.layoutHeight(constant:1)
        borderView.layoutBottomToBottom(view:self)
        borderView.layoutEqualsHorizontal(view:self)
    }
}
