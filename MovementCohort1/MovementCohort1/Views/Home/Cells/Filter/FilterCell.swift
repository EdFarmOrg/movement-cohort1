//
//  FilterCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/17/23.
//

import UIKit

final class FilterCell: UICollectionViewCell {
    static let kind = String(describing: FilterCell.self)
    static let reuseIdentifer = String(describing: FilterCell.self)
    static let nib = UINib(nibName: String(describing: FilterCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
