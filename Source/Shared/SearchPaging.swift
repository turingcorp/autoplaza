import Foundation

struct SearchPaging {
    var total:Int
    var offset:Int
    var limit:Int
    
    init() {
        self.total = 0
        self.offset = 0
        self.limit = 0
    }
}
