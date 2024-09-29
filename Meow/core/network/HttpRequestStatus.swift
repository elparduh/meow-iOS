import Foundation

enum HttpRequestStatus {
    case successfulRequest
    case badRequest
    case unauthorizedRequest
    case forbiddenRequest
    case internalServerError
    case notFoundError
    case connectionNetwork
    case unknown(String)
}

extension HttpRequestStatus {
    
    func getMessage() -> String {
        switch self {
        case .successfulRequest: "Success"
        case .badRequest: "Bad request"
        case .unauthorizedRequest: "User unauthorized"
        case .forbiddenRequest: "Forbidden request"
        case .internalServerError: "Some thing went wrong"
        case .notFoundError: "Url not found"
        case .connectionNetwork: "No internet connection"
        case .unknown(let msg): msg
        }
    }
}
