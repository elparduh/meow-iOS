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
