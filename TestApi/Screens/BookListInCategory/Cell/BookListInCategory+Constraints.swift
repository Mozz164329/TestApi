import Foundation
import UIKit

extension BookListInCategoryCell {
    
    func constraints() {
        imageBook.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelAuthor.translatesAutoresizingMaskIntoConstraints = false
        labelPublisher.translatesAutoresizingMaskIntoConstraints = false
        labelRank.translatesAutoresizingMaskIntoConstraints = false
        linkBuy.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageBook.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageBook.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageBook.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageBook.heightAnchor.constraint(equalToConstant: 200).isActive = true
        labelName.topAnchor.constraint(equalTo: imageBook.bottomAnchor,
                                       constant: 10).isActive = true
        labelName.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor,
                                              constant: 10).isActive = true
        labelDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        labelDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        labelAuthor.topAnchor.constraint(equalTo: labelDescription.bottomAnchor,
                                         constant: 10).isActive = true
        labelAuthor.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelPublisher.topAnchor.constraint(equalTo: labelAuthor.bottomAnchor,
                                            constant: 10).isActive = true
        labelPublisher.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelRank.topAnchor.constraint(equalTo: labelPublisher.bottomAnchor,
                                       constant: 10).isActive = true
        labelRank.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        linkBuy.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        linkBuy.topAnchor.constraint(equalTo: labelRank.bottomAnchor).isActive = true
        linkBuy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        linkBuy.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
