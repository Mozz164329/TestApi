import Foundation

protocol BookCategoriesRouterProtocol {
    func showNextVC(with category: String)
}

final class BookCategoriesRouter: BaseRouter { }

// MARK: - BookCategoriesRouterProtocol
extension BookCategoriesRouter: BookCategoriesRouterProtocol {
    
    func showNextVC(with category: String) {
        let vc = screenFactory.buildScreen(for: .bookListInCategory(category: category))
        push(viewController: vc)
    }
}
