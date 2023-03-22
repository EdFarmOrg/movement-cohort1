//
//  DetailHeader.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/9/23.
//

import UIKit

class DetailHeaderCell: UICollectionViewCell {
    static let kind = String(describing: DetailHeaderCell.self)
    static let reuseIdentifer = String(describing: DetailHeaderCell.self)
    static let nib = UINib(nibName: String(describing: DetailHeaderCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
