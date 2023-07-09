import UIKit

class BaseRouter: NSObject {

    //MARK: - Internal Properties

    lazy var screenFactory = ScreenFactory()

    var presentedViewController: UIViewController? {
        UIWindow.key?.rootViewController?.presentedViewController
    }
   //MARK: - Private Properties

    private weak var rootViewController: UIViewController?

    private var navigationController: UINavigationController? {
        rootViewController?.navigationController
    }

    //MARK: - Initialization

    init(viewController: UIViewController) {
        self.rootViewController = viewController
        super.init()
    }

    final func push(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.pushViewController(viewController, animated: animated, completion: completion)
    }

    final func pop(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.popViewController(animated: animated, completion: completion)
    }

    final func popToRoot(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.popToRoot(animated: animated, completion: completion)
    }

    final func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.present(viewController, animated: animated, completion: completion)
    }

    final func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.dismiss(animated: animated, completion: completion)
    }

    final func dismissNavigationContainer(animated: Bool = true, completion: (() -> Void)? = nil) {
        rootViewController?.navigationController?.dismiss(animated: animated, completion: completion)
    }

    final func dismissPresentedViewController() {
        rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }

    final func setWindowRoot(viewController: UIViewController) {
        guard let window = rootViewController?.view.window else {
            return
        }
        window.rootViewController = viewController
    }
}
