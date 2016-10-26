import Foundation

extension URL {
    
    /**
     QueryStringをDictionaryに分解する
     */
    var queryParams: [String : String] {
        var results: [String : String] = [:]
        guard let urlComponents = URLComponents(string: absoluteString), let items = urlComponents.queryItems else {
            return results
        }
        for item in items {
            results[item.name] = item.value
        }
        return results
    }
}
