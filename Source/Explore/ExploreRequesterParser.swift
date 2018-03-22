import Foundation

class ExploreRequesterParser:JsonParserProtocol {
    typealias Model = SearchResponse
    
    func parse(data:Data) throws -> SearchResponse {
        let json:[String:Any] = try self.getJsonFrom(data:data)
        return SearchResponse()
    }
}
