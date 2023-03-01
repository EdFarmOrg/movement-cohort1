//
//  Item.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/5/23.
//

import Foundation

struct HomeItem: Codable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    
    init(id: String = "", title: String = "", subtitle: String = "", image: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
