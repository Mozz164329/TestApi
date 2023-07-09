import UIKit
struct ScreenFactory {
    
    func buildScreen<ViewControllerType: UIViewController>(for target: Target) -> ViewControllerType {
        switch target {
        case .bookCategories:
            return BookCategoriesVC.buildScreen() as! ViewControllerType
        case .bookListInCategory(let category):
            return BookListInCategoryVC.buildScreen(category: category) as! ViewControllerType
        }
    }
}
