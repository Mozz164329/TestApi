import UIKit

extension UITableView {

    func dequeue<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: String(describing: type)) as? T
        else {
            fatalError("Could not deque cell with type \(T.self)")
        }
        view.awakeFromNib()
        return view
    }

    func dequeue<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T
        else {
            fatalError("Could not deque cell with type \(T.self)")
        }
        cell.awakeFromNib()
        return cell
    }

    func dequeue<T: CellType>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T
        else {
            fatalError("Could not deque cell with type \(T.self)")
        }
        cell.awakeFromNib()
        return cell
    }

    func dequeue<T: UITableViewCell>(_ type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: type)) as? T
        else {
            fatalError("Could not deque cell with type \(T.self)")
        }
        cell.awakeFromNib()
        return cell
    }
}
