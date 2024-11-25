import Foundation

protocol CatImageRepositoryProtocol {
    var catImageRemoteDataSourceProtocol: CatImageRemoteDataSourceProtocol { get }
    func fetchCatImage() async throws -> CatImage
}

struct CatImageRepository: CatImageRepositoryProtocol {
    
    var catImageRemoteDataSourceProtocol: CatImageRemoteDataSourceProtocol
    
    init(catImageRemoteDataSourceProtocol: CatImageRemoteDataSourceProtocol) {
        self.catImageRemoteDataSourceProtocol = catImageRemoteDataSourceProtocol
    }
    
    func fetchCatImage() async throws -> CatImage {
        try await catImageRemoteDataSourceProtocol.fetchCatImage()
    }
}
