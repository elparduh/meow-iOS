import Foundation

protocol CatImageRemoteDataSourceProtocol {
  func fetchCatImage() async throws -> CatImage
}

struct CatImageRemoteDataSource: CatImageRemoteDataSourceProtocol {

  private let urlSession: URLSession
  private let httpRequestHandler: HttpRequestHandler
  
  init(urlSession: URLSession, httpRequestHandler: HttpRequestHandler) {
    self.urlSession = urlSession
    self.httpRequestHandler = httpRequestHandler
  }

  func fetchCatImage() async throws -> CatImage {
    guard let url: URL = URL(string: APIConfig.getCat) else{
      throw HttpRequestStatus.invalidURLError
    }

    do {
      let response: APIResponse = try await urlSession.data(for: URLRequest(url: url))

      let httpRequestStatus: HttpRequestStatus = httpRequestHandler.createRequestStatus(response: response)

      if httpRequestStatus.hasErrors() {
        throw httpRequestStatus
      }

      guard let catImageApiResponseList: [CatImageApiResponse] = try? JSONDecoder().decode([CatImageApiResponse].self, from: response.data) else {
        throw HttpRequestStatus.decodingError
      }

      return catImageApiResponseList.first?.asCatImage() ?? CatImage()

    } catch {
      throw httpRequestHandler.createRequestStatusFrom(error: error)
    }
  }
}
