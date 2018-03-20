import Foundation
import CoreData

extension Coredata {
    class func factoryContext(bundle:Bundle) -> NSManagedObjectContext {
        let context:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        return context
    }
}
