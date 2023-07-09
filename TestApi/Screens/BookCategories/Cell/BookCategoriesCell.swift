import UIKit

class BookCategoriesCell: UITableViewCell {
    let labelListName = UILabel()
    let labelPublishedDate = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    override func updateConstraints() {
        self.constraints()
        super.updateConstraints()
    }
    
    func commonInit () {
        contentView.addSubview(labelListName)
        contentView.addSubview(labelPublishedDate)
    }
    
    func constraints() {
        labelListName.translatesAutoresizingMaskIntoConstraints = false
        labelListName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        labelListName.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 10).isActive = true
        labelPublishedDate.translatesAutoresizingMaskIntoConstraints = false
        labelPublishedDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        labelPublishedDate.topAnchor.constraint(equalTo: labelListName.bottomAnchor, constant:                                            10).isActive = true
        labelPublishedDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure(with model:[BookCategoriesModel], for index: IndexPath) {
        setNeedsUpdateConstraints()
        labelListName.text = model.first?.results[index.row].listName
        labelPublishedDate.text = model.first?.results[index.row].newestPublishedDate
    }
    
}
