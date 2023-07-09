import UIKit

protocol CellType: UITableViewCell {
    func fill(with model: Any, eventHandler: EventHandler<Any>?)
}

open class BaseCell<Model, Events>: UITableViewCell, CellType {

    typealias Event = Events

    //MARK: Properties

    var eventHandler: EventHandler<Events>?

    //MARK: View Lifycycle

    override open func awakeFromNib() {
        super.awakeFromNib()
        self.configure()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }

    open override func prepareForReuse() {
        self.eventHandler = nil
        super.prepareForReuse()
        self.reset()
    }

    // MARK: - Public

    func configure() { }

    func reset() { }

    //MARK: AnyCellType

    func fill(with model: Any, eventHandler: EventHandler<Any>?) {
        if let value = model as? Model {
            self.eventHandler = {
                eventHandler?($0)
            }

            self.fill(with: value)
        }
    }

    func fill(with model: Model) { }
}
