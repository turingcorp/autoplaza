import UIKit

class StructureController:UIPageViewController {
    var navigationView:StructureNavigatorView!
    let model:Structure
    
    init() {
        self.model = Structure()
        super.init(transitionStyle:UIPageViewControllerTransitionStyle.scroll,
                   navigationOrientation:UIPageViewControllerNavigationOrientation.horizontal,
                   options:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
    }
}
