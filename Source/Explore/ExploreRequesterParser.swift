import Foundation

class ExploreRequesterParser {
    func parse(data:Data) throws -> [MotorProtocol] {
        let json:Any = try JSONSerialization.jsonObject(
            with:data,
            options:JSONSerialization.ReadingOptions.allowFragments)
        let motors:[MotorProtocol] = try self.parse(json:json)
        return motors
    }
    
    private func parse(json:Any) throws -> [MotorProtocol] {
        guard
            let dictionary:[String:Any] = json as? [String:Any]
        else {
            throw ErrorLocal.malformedServerResponse
        }
        return []
    }
}
