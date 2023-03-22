//
//  ContributorHeader.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/21/23.
//

import UIKit

class ContributorHeader: UICollectionReusableView {
    static let kind = String(describing: StoryContributorCell.self)
    static let reuseIdentifer = String(describing: StoryContributorCell.self)
    static let nib = UINib(nibName: String(describing: StoryContributorCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
