import Foundation

struct JsonMocker {
    static let requestSearch01:Data? = factoryJson(name:Constants.requestSearch01)
    
    private struct Constants {
        static let fileExtension:String = "json"
        static let requestSearch01:String = "JsonRequestSearch01"
    }
    
    private static func factoryJson(name:String) -> Data? {
        let bundle:Bundle = Bundle(for:TestApplication.self)
        guard
            let url:URL = bundle.url(forResource:name, withExtension:Constants.fileExtension)
        else {
            return nil
        }
        let data:Data
        do {
            try data = Data(contentsOf:url)
        } catch {
            return nil
        }
        return data
    }
}
