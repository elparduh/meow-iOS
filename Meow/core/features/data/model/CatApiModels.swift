import Foundation

struct CatImageApiResponse: Decodable {
  let id: String?
  let url: String?
  let width : Int?
  let height : Int?
}

extension CatImageApiResponse {

  func asCatImage() -> CatImage {
    CatImage(id: id ?? "", url: url ?? "")
  }
}
