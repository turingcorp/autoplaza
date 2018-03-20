import Foundation
import CoreData

class Coredata:DatabaseProtocol {
    private let context:NSManagedObjectContext
    
    init(context:NSManagedObjectContext = Coredata.factoryContext()) {
        self.context = context
    }
    
    func create<Entity:NSManagedObject>(completion:@escaping((Entity) -> ())) {
        self.context.perform {
            guard
                let description:NSEntityDescription = self.factoryEntityDescription(name:Entity.name),
                let entity:Entity = self.insertEntity(description:description) as? Entity
            else {
                return
            }
            completion(entity)
        }
    }
    
    private func factoryEntityDescription(name:String) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName:name, in:self.context)
    }
    
    private func insertEntity(description:NSEntityDescription) -> NSManagedObject? {
        return NSManagedObject(entity:description, insertInto:self.context)
    }
}
