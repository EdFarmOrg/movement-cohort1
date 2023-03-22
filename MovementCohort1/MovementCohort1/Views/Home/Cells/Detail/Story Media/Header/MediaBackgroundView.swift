//
//  CollectionReusableView.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/16/23.
//

import Foundation
import UIKit

class MediaBackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
