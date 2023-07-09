import Foundation

class BookCategoriesPresenter: BasePresenter {
    
    // MARK: - Properties
    private var bookCategoriesServiceNetwork = BookCategoriesServiceNetwork()
    private var bookCategories: [BookCategoriesModel] = []
    
    private var mainView: BookCategoriesVCProtocol? {
        view as? BookCategoriesVCProtocol
    }
    
    private var mainRouter: BookCategoriesRouterProtocol? {
        router as? BookCategoriesRouterProtocol
    }
    
    func getBookCategories() {
        let urlString = Endpoints.current.allBookCategories+Endpoints.current.apiKey
        bookCategoriesServiceNetwork.getBookCategories(endpoint: urlString) { [weak self] result in
            switch result {
            case .success(let news):
                self?.bookCategories.append(news)
                self?.mainView?.updateTableView()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - BookCategoriesPresenterProtocol
extension BookCategoriesPresenter: BookCategoriesPresenterProtocol {
    func showNextVC(with category: String) {
        mainRouter?.showNextVC(with: category)
    }
    
    var getbookCategoriesItemsCount: Int {
        return bookCategories.first?.numResults ?? 0
    }
    
    var getbookCategoriesItems: [BookCategoriesModel] {
        return bookCategories
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookCategories()
    }
}

