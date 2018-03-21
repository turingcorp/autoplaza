import Foundation

class ExploreRequester:ExploreRequesterProtocol {
    func loadMotors(
        configuration:SearchConfiguration,
        success:@escaping(([MotorProtocol]) -> ()),
        error:@escaping ((Error) -> ())) {
        
    }
}


// https://api.mercadolibre.com/sites/MLM/search?category=1743&limit=1&offset=0
