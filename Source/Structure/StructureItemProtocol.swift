import UIKit

protocol StructureItemProtocol {
    var index:Int { get }
    var controllerType:UIViewController.Type { get }
    var navigationConfiguration:((StructureNavigatorView) -> () -> ()) { get }
    
    init(index:Int)
}
