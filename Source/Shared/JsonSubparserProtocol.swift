import Foundation

protocol JsonSubparserProtocol {
    associatedtype Model
    
    func parse(json:[String:Any]) throws -> Model
}
