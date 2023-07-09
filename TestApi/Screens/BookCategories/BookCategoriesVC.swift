import UIKit

class BookCategoriesVC: BaseViewController {
    private let tableView: UITableView = UITableView()
    // MARK: - Properties
    private var mainPresenter: BookCategoriesPresenterProtocol? {
        presenter as? BookCategoriesPresenterProtocol
    }
    
    func setupTableView () {
        view.addSubview(tableView)
        tableView.register(BookCategoriesCell.self, forCellReuseIdentifier: "BookCategoriesCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - BookCategoriesVCProtocol
extension BookCategoriesVC: BookCategoriesVCProtocol {
    
    func setupUI() {
        setupTableView()
    }
    
    func updateTableView() {
        tableView.reloadData()
    }
}

extension BookCategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainPresenter?.getbookCategoriesItemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellType: BookCategoriesCell.self, for: indexPath)
        guard let model = mainPresenter?.getbookCategoriesItems else { return cell }
        cell.configure(with: model, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenCategoryString = mainPresenter?.getbookCategoriesItems.first?.results[indexPath.row].listNameEncoded ?? ""
        mainPresenter?.showNextVC(with: chosenCategoryString)
    }
}
