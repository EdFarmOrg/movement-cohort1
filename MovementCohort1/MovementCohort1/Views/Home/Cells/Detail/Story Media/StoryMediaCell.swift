//
//  StoryMediaCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/16/23.
//

import UIKit

class StoryMediaCell: UICollectionViewCell {
    static let kind = String(describing: StoryMediaCell.self)
    static let reuseIdentifer = String(describing: StoryMediaCell.self)
    static let nib = UINib(nibName: String(describing: StoryMediaCell.self), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
