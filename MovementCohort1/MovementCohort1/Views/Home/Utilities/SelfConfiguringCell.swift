//
//  SelfConfiguringCell.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/5/23.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseIdentifer: String { get }
    func configure(with item: HomeItem)
}
