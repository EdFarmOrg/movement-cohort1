//
//  BackgroundView.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/27/23.
//

import Foundation
import UIKit

class FilterBackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.base(.darkGray)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
