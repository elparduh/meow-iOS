import Foundation

enum HttpRequestStatus: Error {
  case successfulRequest
  case badRequest
  case unauthorizedRequest
  case forbiddenRequest
  case internalServerError
  case notFoundError
  case connectionNetwork
  case unknown(String)
  case invalidURLError
  case decodingError
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
    case .invalidURLError: "Invalid URL"
    case .decodingError: "Decoding Error"
    }
  }

  func hasErrors() -> Bool {
    switch self {
    case .badRequest, .unauthorizedRequest, .forbiddenRequest, .internalServerError, .notFoundError, .connectionNetwork, .unknown, .invalidURLError, .decodingError:
      return true
    case .successfulRequest:
      return false
    }
  }
}
