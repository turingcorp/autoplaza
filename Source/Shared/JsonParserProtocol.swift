import Foundation

protocol JsonParserProtocol {
    associatedtype Model
    
    func parse(data:Data) throws -> [Model]
}
