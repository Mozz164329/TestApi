extension BookListInCategoryVC {
    
    static func buildScreen(category:String) -> BookListInCategoryVC {
        let viewController = BookListInCategoryVC()
        let router = BookListInCategoryRouter(viewController: viewController)
        let presenter = BookListInCategoryPresenter(view: viewController, router: router, category: category)
        viewController.presenter = presenter
        return viewController
    }
}
