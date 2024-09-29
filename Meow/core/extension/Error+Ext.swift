import Foundation

extension Error {
    
    func isNetworkConnectionError() -> Bool {
        let networkErrors = [NSURLErrorNetworkConnectionLost, NSURLErrorNotConnectedToInternet]
        let error = self as NSError
        
        return networkErrors.contains(error.code)
    }
}
