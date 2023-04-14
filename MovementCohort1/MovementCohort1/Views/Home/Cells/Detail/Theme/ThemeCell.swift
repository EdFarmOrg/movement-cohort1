//
//  ThemeCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/28/23.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    static let kind = String(describing: ThemeCell.self)
    static let reuseIdentifer = String(describing: ThemeCell.self)
    static let nib = UINib(nibName: String(describing: ThemeCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
