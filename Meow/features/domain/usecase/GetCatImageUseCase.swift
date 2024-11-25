import Foundation

protocol GetCatImageUseCaseProtocol {
    var catImageRepositoryProtocol: CatImageRepositoryProtocol { get }
    func fetchCatImage() async -> Result<CatImage, Error>
}

struct GetCatImageUseCase: GetCatImageUseCaseProtocol {
    
    var catImageRepositoryProtocol:  CatImageRepositoryProtocol
    
    init(catImageRepositoryProtocol: CatImageRepositoryProtocol) {
        self.catImageRepositoryProtocol = catImageRepositoryProtocol
    }
    
    func fetchCatImage() async -> Result<CatImage, Error> {
        do {
            let result = try await catImageRepositoryProtocol.fetchCatImage()
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
