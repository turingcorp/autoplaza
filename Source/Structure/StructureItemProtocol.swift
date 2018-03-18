import UIKit

protocol StructureItemProtocol {
    var index:Int { get }
    var controllerType:UIViewController.Type { get }
    
    init(index:Int)
}
