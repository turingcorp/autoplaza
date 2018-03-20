import Foundation
import CoreData

class Coredata:DatabaseProtocol {
    private let context:NSManagedObjectContext
    
    init(context:NSManagedObjectContext) {
        self.context = context
    }
}
