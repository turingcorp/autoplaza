import Foundation

class ExploreRequesterParser:JsonParserProtocol {
    let pagingParser:ExploreRequesterParserPaging
    let resultsParser:ExploreRequesterParserResults
    
    init() {
        self.pagingParser = ExploreRequesterParserPaging()
        self.resultsParser = ExploreRequesterParserResults()
    }
    
    func parse(data:Data) throws -> SearchResponse {
        let json:[String:Any] = try self.getJsonFrom(data:data)
        let response:SearchResponse = try self.parseReponse(json:json)
        return response
    }
    
    private func parseReponse(json:[String:Any]) throws -> SearchResponse {
        var reponse:SearchResponse = SearchResponse()
        reponse.paging = try self.pagingParser.parse(json:json)
        return reponse
    }
}
