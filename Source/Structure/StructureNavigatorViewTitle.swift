import UIKit

class StructureNavigatorViewTitle:UIView {
    private(set) weak var currentTitle:UILabel!
    private(set) weak var animationTitle:UILabel!
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = false
        
        let currentTitle:UILabel = self.factoryLabel()
        self.currentTitle = currentTitle
        
        let animationTitle:UILabel = self.factoryLabel()
        animationTitle.alpha = 0
        self.animationTitle = animationTitle
        
        self.addSubview(currentTitle)
        self.addSubview(animationTitle)
        
        currentTitle.layoutEquals(view:self)
        animationTitle.layoutEquals(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func factoryLabel() -> UILabel {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(
            ofSize:StructureNavigatorView.Constants.titleFontSize,
            weight:UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        return label
    }
    
    func updateTitle(title:String) {
        self.animateTitle(title:title)
        self.updateTitleReferences()
    }
    
    private func animateTitle(title:String) {
        self.animationTitle.text = title
        self.animationTitle.alpha = 1
        self.currentTitle.alpha = 0
    }
    
    private func updateTitleReferences() {
        let temporalLabel:UILabel = self.currentTitle
        self.currentTitle = self.animationTitle
        self.animationTitle = temporalLabel
    }
}
