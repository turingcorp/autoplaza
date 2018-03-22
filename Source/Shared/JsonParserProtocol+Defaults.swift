import Foundation

extension JsonParserProtocol {
    func getJsonFrom(data:Data) throws -> [String:Any] {
        let json:Any = try JSONSerialization.jsonObject(
            with:data,
            options:JSONSerialization.ReadingOptions.allowFragments)
        guard
            let dictionary:[String:Any] = json as? [String:Any]
        else {
            throw ErrorLocal.malformedServerResponse
        }
        return dictionary
    }
}
