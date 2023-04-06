//
//  OrganizationCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/27/23.
//

import UIKit

class OrganizationCell: UICollectionViewCell {
    static let kind = String(describing: OrganizationCell.self)
    static let reuseIdentifer = String(describing: OrganizationCell.self)
    static let nib = UINib(nibName: String(describing: OrganizationCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
