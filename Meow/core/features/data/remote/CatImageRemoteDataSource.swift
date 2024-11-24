import Foundation

protocol CatImageRemoteDataSourceProtocol {
  func fetchCatImage() async throws -> CatImage
}

struct CatImageRemoteDataSource: CatImageRemoteDataSourceProtocol {

  private let httpRequestHandler: HttpRequestHandler
  private let urlSession: URLSession

  init(httpRequestHandler: HttpRequestHandler, urlSession: URLSession) {
    self.httpRequestHandler = httpRequestHandler
    self.urlSession = urlSession
  }

  func fetchCatImage() async throws -> CatImage {
    return CatImage()
  }
}
