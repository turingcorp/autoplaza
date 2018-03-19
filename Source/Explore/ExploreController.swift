import UIKit

class ExploreController:UIViewController {
    let model:Explore
    
    init() {
        self.model = Explore()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = ExploreView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
