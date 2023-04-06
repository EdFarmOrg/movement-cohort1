//
//  MediaHeaderCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/16/23.
//

import UIKit

class StoryHeader: UICollectionReusableView, SelfConfiguringCell {
    func configure(with item1: String, and item2: String) {
            firstLbl.text = item1
            secondLbl.text = item2
    }
    
    
    static let kind = String(describing: StoryHeader.self)
    static let reuseIdentifer = String(describing: StoryHeader.self)
    static let nib = UINib(nibName: String(describing: StoryHeader.self), bundle: nil)
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    
}
