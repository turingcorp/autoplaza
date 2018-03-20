import Foundation
import CoreData

extension Coredata {
    class func factoryContext(bundle:Bundle = Bundle.main) -> NSManagedObjectContext {
        let context:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        return context
    }
}
