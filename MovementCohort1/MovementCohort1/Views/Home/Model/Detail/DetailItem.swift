//
//  DetailItem.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/13/23.
//

import Foundation

struct DetailItem: Codable, Hashable {
    let id = UUID()
    let title: String
    let subTitle: String
    let image: String
    
    init(id: String = "", title: String = "", subTitle: String = "", image: String = "") {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
}
