import Foundation

class BasePresenter {

    weak var view: BaseViewControllerProtocol?

    var router: BaseRouter?

    init(view: BaseViewControllerProtocol, router: BaseRouter?) {
        self.view = view
        self.router = router
    }
}

// MARK: - BasePresenterProtocol

extension BasePresenter: BasePresenterProtocol {

    @objc
    func viewDidLoad() {
        view?.setupUI()
    }

    @objc
    func viewWillAppear() {
    }

    @objc
    func viewDidAppear() {
    }

    @objc
    func viewWillDisappear() {
    }
}
