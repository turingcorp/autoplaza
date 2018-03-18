import UIKit

class StructureNavigatorView:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedGrayColour
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
