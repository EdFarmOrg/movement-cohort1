//
//  WTMDescriptionCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/27/23.
//

import UIKit

class WTMDescriptionCell: UICollectionViewCell {
    static let kind = String(describing: WTMDescriptionCell.self)
    static let reuseIdentifer = String(describing: WTMDescriptionCell.self)
    static let nib = UINib(nibName: String(describing: WTMDescriptionCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
