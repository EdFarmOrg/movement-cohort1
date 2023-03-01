//
//  Section.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 2/5/23.
//

import Foundation

struct HomeSection: Hashable {
    let id = UUID()
    
    let type: HomeSectionType
    let title: String
    let subtitle: String
    let items: [HomeItem]
    
    init(type: HomeSectionType, title: String = "", subtitle: String = "", items: [HomeItem] = []) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum ItemSectiontype: String {
        case scroller
        case card
        case filter
    }
    
    struct HomeSectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        static let scroller = HomeSectionType(rawValue: HomeSection.ItemSectiontype.scroller.rawValue)
        static let card = HomeSectionType(rawValue: HomeSection.ItemSectiontype.card.rawValue)
        static let filter = HomeSectionType(rawValue: HomeSection.ItemSectiontype.filter.rawValue)

    }
}
