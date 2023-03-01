//
//  HomeCardCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/22/23.
//

import UIKit

class HomeCardCell: UICollectionViewCell {
    static let kind = String(describing: HomeCardCell.self)
    static let reuseIdentifer = String(describing: HomeCardCell.self)
    static let nib = UINib(nibName: String(describing: HomeCardCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
