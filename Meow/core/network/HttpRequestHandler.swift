import Foundation

struct HttpRequestHandler {
    
    func createRequestStatus(response: (data: Data, httpResponse: URLResponse)) -> HttpRequestStatus {
        let httpResponse = response.httpResponse as? HTTPURLResponse
        switch httpResponse?.statusCode {
        case 200: return HttpRequestStatus.successfulRequest
        case 400: return HttpRequestStatus.badRequest
        case 401: return HttpRequestStatus.unauthorizedRequest
        case 403: return HttpRequestStatus.forbiddenRequest
        case 404: return HttpRequestStatus.notFoundError
        case 500: return HttpRequestStatus.internalServerError
        default:
            return HttpRequestStatus.unknown(String(data: response.data, encoding: String.Encoding.utf8) ?? "Unknown");
        }
    }
}
