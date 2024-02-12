//
//  CollectionViewCell.swift
//  CollectionViewBackSample
//
//  Created by Hina on 2024/02/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var selectedIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setIcon(imageString: String) {
        selectedIcon.image = UIImage(named: imageString)
    }

}
