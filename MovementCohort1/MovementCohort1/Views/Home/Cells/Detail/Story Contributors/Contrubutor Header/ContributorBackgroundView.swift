//
//  ContributorBackgroundView.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/21/23.
//

import UIKit

class ContributorBackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
