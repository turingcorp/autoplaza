import Foundation

class ExploreRequesterParser:JsonParserProtocol {
    typealias Model = MotorProtocol
    
    func parse(data:Data) throws -> [MotorProtocol] {
        let json:[String:Any] = try self.getJsonFrom(data:data)
    }
}
