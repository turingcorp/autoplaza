import UIKit

class StructureController:UIPageViewController {
    init() {
        super.init(transitionStyle:UIPageViewControllerTransitionStyle.scroll,
                   navigationOrientation:UIPageViewControllerNavigationOrientation.horizontal, options:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
