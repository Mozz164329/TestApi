import UIKit

extension UINavigationController {

    func popToRoot(animated: Bool, completion: (() -> Void)?) {
        popToRootViewController(animated: animated)
        guard animated, let coordinator = transitionCoordinator else {
            completion?()
            return
        }
        coordinator.animate(alongsideTransition: nil, completion: { _ in
             completion?()
        })
    }

    func popViewController(animated: Bool, completion: (() -> Void)?) {
        popViewController(animated: animated)
        guard animated, let coordinator = transitionCoordinator else {
            completion?()
            return
        }
        coordinator.animate(alongsideTransition: nil, completion: { _ in
             completion?()
        })
    }
}
