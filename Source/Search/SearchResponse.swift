import Foundation

struct SearchResponse {
    var paging:SearchPaging
    
    init() {
        self.paging = SearchPaging()
    }
}
