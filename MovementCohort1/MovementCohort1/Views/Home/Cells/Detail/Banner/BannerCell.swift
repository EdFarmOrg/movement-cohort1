//
//  BannerCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/16/23.
//

import UIKit

class BannerCell: UICollectionViewCell {
    static let kind = String(describing: BannerCell.self)
    static let reuseIdentifer = String(describing: BannerCell.self)
    static let nib = UINib(nibName: String(describing: BannerCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
