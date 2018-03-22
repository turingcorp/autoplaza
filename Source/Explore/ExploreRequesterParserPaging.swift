import Foundation

class ExploreRequesterParserPaging {
    private struct Constants {
        static let root:String = "paging"
        static let offset:String = "offset"
        static let total:String = "total"
        static let limit:String = "limit"
    }
    
    func parse(json:[String:Any]) throws -> SearchPaging {
        guard
            let root:[String:Any] = json[Constants.root] as? [String:Any],
            let offset:Int = root[Constants.offset] as? Int,
            let total:Int = root[Constants.total] as? Int,
            let limit:Int = root[Constants.limit] as? Int
        else {
            throw ErrorLocal.invalidServerResponse
        }
        var paging:SearchPaging = SearchPaging()
        paging.offset = offset
        paging.total = total
        paging.limit = limit
        return paging
    }
}
