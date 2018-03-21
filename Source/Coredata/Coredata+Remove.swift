import Foundation

extension Coredata {
    class func removeStoreIn(bundle:Bundle, suffix:String = String()) {
        let storeURL:URL = factoryStoreURL(bundle:bundle, suffix:suffix)
        if FileManager.default.fileExists(atPath:storeURL.path) {
            do {
                try FileManager.default.removeItem(at:storeURL)
            } catch let error {
                assertionFailure(error.localizedDescription)
            }
        }
    }
}
