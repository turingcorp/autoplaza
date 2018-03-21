import Foundation
import CoreData

class Coredata:DatabaseProtocol {
    private let context:NSManagedObjectContext
    
    init(context:NSManagedObjectContext = Coredata.factoryContext()) {
        self.context = context
    }
    
    func create<Entity:NSManagedObject>(completion:@escaping((Entity) -> ())) {
        self.context.perform {
            let description:NSEntityDescription = self.factoryEntityDescription(name:Entity.name)
            let entity:Entity = self.insertEntity(description:description)
            completion(entity)
        }
    }
    
    private func factoryEntityDescription(name:String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName:name, in:self.context)!
    }
    
    private func insertEntity<Entity:NSManagedObject>(description:NSEntityDescription) -> Entity {
        return NSManagedObject(entity:description, insertInto:self.context) as! Entity
    }
    
    func load<Entity:NSManagedObject>(request:NSFetchRequest<Entity>, completion:@escaping(([Entity]) -> ())) {
        self.context.perform {
            let data:[NSManagedObject]
            do {
                data = try self.context.fetch(request)
            } catch let error {
                assertionFailure(error.localizedDescription)
                return
            }
            let results:[Entity] = data as! [Entity]
            completion(results)
        }
    }
    
    func save(completion:@escaping(() -> ())) {
        guard
            self.context.hasChanges == true
        else {
            completion()
            return
        }
        self.context.perform {
            do {
                try self.context.save()
            } catch let error {
                assertionFailure(error.localizedDescription)
            }
            completion()
        }
    }
}
