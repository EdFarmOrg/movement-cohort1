//
//  MediaHeaderCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/16/23.
//

import UIKit

class MediaHeader: UICollectionReusableView {
    static let kind = String(describing: MediaHeader.self)
    static let reuseIdentifer = String(describing: MediaHeader.self)
    static let nib = UINib(nibName: String(describing: MediaHeader.self), bundle: nil)
}
