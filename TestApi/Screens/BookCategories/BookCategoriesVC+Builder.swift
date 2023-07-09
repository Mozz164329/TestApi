extension BookCategoriesVC {
    
    static func buildScreen() -> BookCategoriesVC {
        let viewController = BookCategoriesVC()
        let router = BookCategoriesRouter(viewController: viewController)
        let presenter = BookCategoriesPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
}
