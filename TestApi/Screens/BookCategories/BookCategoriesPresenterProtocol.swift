import Foundation

protocol BookCategoriesPresenterProtocol: BasePresenterProtocol {
    var getbookCategoriesItemsCount: Int { get }
    var getbookCategoriesItems: [BookCategoriesModel] { get }
    func showNextVC(with category: String) 
}
