import Foundation
import CoreData

extension Coredata {
    class func factoryContext(bundle:Bundle = Bundle.main, suffix:String = String()) -> NSManagedObjectContext {
        let context:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        context.mergePolicy = NSMergePolicy(merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        context.persistentStoreCoordinator = factoryStoreIn(bundle:bundle, suffix:suffix)
        return context
    }
    
    class func factoryStoreURL(bundle:Bundle, suffix:String) -> URL {
        let sqliteFile:String = factorySqliteFile(bundle:bundle, suffix:suffix)
        let url:URL = FileManager.default.applicationDirectory.appendingPathComponent(sqliteFile)
        return url
    }
    
    class func factorySqliteFile(bundle:Bundle, suffix:String) -> String {
        var sqliteFile:String = factoryIdentifier(bundle:bundle)
        sqliteFile.append(".")
        sqliteFile.append(Constants.name)
        sqliteFile.append(suffix)
        sqliteFile.append(".")
        sqliteFile.append(Constants.sqliteExtension)
        return sqliteFile
    }
    
    class func factoryFetchRequest<Entity:NSManagedObject>() -> NSFetchRequest<Entity> {
        let request:NSFetchRequest<Entity> = NSFetchRequest(entityName:Entity.name)
        request.returnsObjectsAsFaults = false
        return request
    }
    
    private class func factoryStoreIn(bundle:Bundle, suffix:String) -> NSPersistentStoreCoordinator? {
        guard
            let model:NSManagedObjectModel = factoryModel(),
            let store:NSPersistentStoreCoordinator = factoryStoreIn(bundle:bundle, with:suffix, and:model)
        else {
            return nil
        }
        return store
    }
    
    private class func factoryModel() -> NSManagedObjectModel? {
        guard
            let url:URL = Bundle.main.url(forResource:Constants.name, withExtension:Constants.modelExtension),
            let model:NSManagedObjectModel = NSManagedObjectModel(contentsOf:url)
        else {
            return nil
        }
        return model
    }
    
    private class func factoryStoreIn(
        bundle:Bundle,
        with suffix:String,
        and model:NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        let url:URL = factoryStoreURL(bundle:bundle, suffix:suffix)
        let store:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel:model)
        do {
            try store.addPersistentStore(ofType:NSSQLiteStoreType, configurationName:nil, at:url, options:nil)
        } catch {
            return nil
        }
        return store
    }
    
    private class func factoryIdentifier(bundle:Bundle) -> String {
        guard
            let identifier:String = bundle.bundleIdentifier
        else {
            return String()
        }
        return identifier
    }
}
