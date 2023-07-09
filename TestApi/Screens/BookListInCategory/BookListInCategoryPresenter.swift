import Foundation

class BookListInCategoryPresenter: BasePresenter {
    
    init(view: BaseViewControllerProtocol, router: BaseRouter?, category: String) {
        categoryString = category
        super.init(view: view, router: router)
    }
    
    // MARK: - Properties
    private let bookListInCategoryServiceNetwork = BookListInCategoryNetworkService()
    private var categoryString: String = ""
    private var booksListInCategoryModel:[BookListInCategoryModel] = []
    
    private var mainView: BookListInCategoryVCProtocol? {
        view as? BookListInCategoryVCProtocol
    }
    
    private var mainRouter: BookListInCategoryRouterProtocol? {
        router as? BookListInCategoryRouterProtocol
    }
    
    func getBookInCategory() {
        let urlString = Endpoints.current.bookInCategory+categoryString+".json"+Endpoints.current.apiKey
        bookListInCategoryServiceNetwork.getBookListInCategories(endpoint: urlString) { [weak self] result in
            switch result {
            case .success(let news):
                self?.booksListInCategoryModel.append(news)
                self?.mainView?.updateTableView()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - BookListInCategoryPresenterProtocol
extension BookListInCategoryPresenter: BookListInCategoryPresenterProtocol {
    var getBooksListInCategoryModel: [BookListInCategoryModel] {
        return booksListInCategoryModel
    }
    
    var getBooksListInCategoryCount: Int {
        return booksListInCategoryModel.first?.results.books.count ?? 0
    }
    
    override func viewDidLoad() {
        getBookInCategory()
        super.viewDidLoad()
    }
}
