import UIKit

class ExploreView:UIView {
    private(set) weak var activityIndicator:UIActivityIndicatorView?
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.red
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    deinit {
        self.activityIndicator?.stopAnimating()
    }
    
    private func factoryViews() {
        let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(
            activityIndicatorStyle:UIActivityIndicatorViewStyle.gray)
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        self.activityIndicator = activityIndicator
        
        self.addSubview(activityIndicator)
        
        activityIndicator.layoutEquals(view:self)
    }
}
