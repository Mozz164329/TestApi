import UIKit
import SafariServices

class BookListInCategoryVC: BaseViewController {
    
    // MARK: - Properties
    private var tableView = UITableView()
    private var mainPresenter: BookListInCategoryPresenterProtocol? {
        presenter as? BookListInCategoryPresenterProtocol
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(BookListInCategoryCell.self,
                           forCellReuseIdentifier: "BookListInCategoryCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - BookListInCategoryVCProtocol
extension BookListInCategoryVC: BookListInCategoryVCProtocol {
    
    func setupUI() {
        setupTableView()
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
}

extension BookListInCategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainPresenter?.getBooksListInCategoryCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellType: BookListInCategoryCell.self, for: indexPath)
        guard let model = mainPresenter?.getBooksListInCategoryModel else { return cell }
        cell.configure(with: model, for: indexPath)
        cell.completion = { [weak self] stringURL in
            guard let url = URL(string: stringURL) else { return }
            let vc = SFSafariViewController(url: url)
            self?.present(vc, animated: true)
        }
        return cell
    }
}
