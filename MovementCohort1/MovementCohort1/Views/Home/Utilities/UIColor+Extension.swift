//
//  UIColor+Extension.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/1/23.
//

import UIKit

enum BaseColor {
    case darkGray
}

extension UIColor {
    static func base(_ color: BaseColor) -> UIColor? {
        switch color {
        case .darkGray:
            return UIColor(named: "baseDarkGray")
        }
    }
}
