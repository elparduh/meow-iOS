import Foundation

typealias APIResponse = (data: Data, httpResponse: URLResponse)

struct HttpRequestHandler {
    
    func createRequestStatus(response: APIResponse) -> HttpRequestStatus {
        let httpResponse = response.httpResponse as? HTTPURLResponse
        
        switch httpResponse?.statusCode {
        case 200: return HttpRequestStatus.successfulRequest
        case 400: return HttpRequestStatus.badRequest
        case 401: return HttpRequestStatus.unauthorizedRequest
        case 403: return HttpRequestStatus.forbiddenRequest
        case 404: return HttpRequestStatus.notFoundError
        case 500: return HttpRequestStatus.internalServerError
        default:
            let serverData = String(data: response.data, encoding: String.Encoding.utf8)
            return HttpRequestStatus.unknown(serverData ?? "Unknown");
        }
    }
    
    func createRequestStatusFrom(error: Error) -> HttpRequestStatus {
        if error.isNetworkConnectionError() {
            return HttpRequestStatus.connectionNetwork
        }
        return HttpRequestStatus.unknown(error.localizedDescription)
    }
}
