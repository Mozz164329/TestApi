import Foundation
import UIKit
import WebKit

class BookListInCategoryCell: UITableViewCell, WKNavigationDelegate {
    
    var labelName = UILabel()
    var labelDescription = UILabel()
    var labelAuthor = UILabel()
    var labelPublisher = UILabel()
    var imageBook = UIImageView()
    var labelRank = UILabel()
    var linkBuy = UIButton()
    var completion: ((String) -> ())?
    
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
        contentView.addSubview(imageBook)
        contentView.addSubview(labelName)
        contentView.addSubview(labelDescription)
        labelDescription.numberOfLines = 0
        contentView.addSubview(labelAuthor)
        contentView.addSubview(labelPublisher)
        contentView.addSubview(labelRank)
        contentView.addSubview(linkBuy)
    }
    
    func configure(with model:[BookListInCategoryModel], for indexPath: IndexPath) {
        setNeedsUpdateConstraints()
        let data = model.first?.results.books[indexPath.row]
        let imageStringURL = data?.bookImage
        let buyLinkStringURL = data?.buyLinks.first?.url
        imageBook.setImage(from: imageStringURL ?? "")
        labelName.text = data?.title
        labelDescription.text = data?.description
        labelAuthor.text = data?.author
        labelPublisher.text = data?.publisher
        labelRank.text = data?.rank.description
        linkBuy.setTitle(data?.buyLinks.first?.url, for: .normal)
        linkBuy.setTitleColor(.blue, for: .normal)
        linkBuy.addAction(UIAction(handler: { _ in
            self.completion?(buyLinkStringURL ?? "")
        }), for: .touchUpInside)
    }
}
