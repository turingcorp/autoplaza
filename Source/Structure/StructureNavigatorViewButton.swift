import UIKit

class StructureNavigatorViewButton:UIButton {
    private(set) var titleView:UILabel!
    
    init(image:UIImage, title:String) {
        let colour:UIColor = UIColor(white:0.6, alpha:1)
        
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.normal)
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.selected)
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.highlighted)
        self.setImage(image.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for:UIControlState.focused)
        self.imageEdgeInsets = UIEdgeInsets(top:Constants.imageInsetTop, left:0, bottom:0, right:0)
        self.imageView!.tintColor = colour
        self.imageView!.contentMode = UIViewContentMode.center
        self.imageView!.clipsToBounds = true
        
        let titleView:UILabel = UILabel()
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor.clear
        titleView.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.light)
        titleView.isUserInteractionEnabled = false
        titleView.textColor = colour
        titleView.textAlignment = NSTextAlignment.center
        titleView.text = title
        self.titleView = titleView
        
        self.addSubview(titleView)
        
        titleView.layoutBottomToBottom(view:self)
        titleView.layoutHeight(constant:Constants.titleHeight)
        titleView.layoutEqualsHorizontal(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
