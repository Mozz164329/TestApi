import Foundation

protocol BookListInCategoryPresenterProtocol: BasePresenterProtocol {
    var getBooksListInCategoryModel: [BookListInCategoryModel] { get }
    var getBooksListInCategoryCount: Int { get }
}
