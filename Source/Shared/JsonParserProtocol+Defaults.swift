import Foundation

extension JsonParserProtocol {
    func getJsonFrom(data:Data) throws -> [String:Any] {
        let object:Any = try JSONSerialization.jsonObject(
            with:data,
            options:JSONSerialization.ReadingOptions.allowFragments)
        let json:[String:Any] = try self.getJsonFrom(object:object)
        return json
    }
    
    private func getJsonFrom(object:Any) throws -> [String:Any] {
        guard
            let json:[String:Any] = object as? [String:Any]
        else {
            throw ErrorLocal.malformedServerResponse
        }
        guard
            json.keys.count > 0
        else {
            throw ErrorLocal.emptyServerResponse
        }
        return json
    }
}
