import Foundation

extension URL {

  func createGetURLRequest() -> URLRequest {
    var urlRequest = URLRequest(url: self)
    urlRequest.httpMethod = "GET"
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
    return urlRequest
  }
}
