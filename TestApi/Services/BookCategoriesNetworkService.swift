import Foundation

protocol BookCategoriesServiceNetworkProtocol {
    
}

final class BookCategoriesServiceNetwork {
    private let networkService = NetworkService()
    func getBookCategories(endpoint: String,
                           completion: @escaping (Result<BookCategoriesModel, Error>)  -> Void) {
        guard let url = URL(string: endpoint) else {
            return
        }
        NetworkService.request(fromURL: url) {
            [weak self] (result: Result<BookCategoriesModel, Error>) in
            completion(result)
        }
    }
}

extension BookCategoriesServiceNetwork: BookCategoriesServiceNetworkProtocol {
    
}
