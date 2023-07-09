import Foundation

protocol BookListInCategoryNetworkServiceProtocol {

}

final class BookListInCategoryNetworkService  {
    private let networkService = NetworkService()
    func getBookListInCategories(endpoint: String,
                 completion: @escaping (Result<BookListInCategoryModel, Error>)  -> Void) {
        guard let url = URL(string: endpoint) else {
            return
        }
        NetworkService.request(fromURL: url) {
            [weak self] (result: Result<BookListInCategoryModel, Error>) in
            completion(result)
        }
    }
}

extension BookListInCategoryNetworkService: BookListInCategoryNetworkServiceProtocol {

}

