import UIKit

class StructureController:UIPageViewController {
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
}
