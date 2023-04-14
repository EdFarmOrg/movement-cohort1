//
//  DetailSection.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/13/23.
//

import Foundation

struct DetailSection: Hashable {
    let id = UUID()
    
    let type: DetailSectionType
    let title: String
    let subtitle: String
    let items: [DetailItem]
    
    init(type: DetailSectionType, title: String = "", subtitle: String = "", items: [DetailItem] = []) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum ItemSectiontype: String {
        case detailHeader
        case detailCard
        case banner
        case storyMedia
        case storyContributor
        case thankYou
        case organization
        case wtmDescription
        case theme
    }
    
    struct DetailSectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        static let header = DetailSectionType(rawValue: DetailSection.ItemSectiontype.detailHeader.rawValue)
        static let card = DetailSectionType(rawValue: DetailSection.ItemSectiontype.detailCard.rawValue)
        static let banner = DetailSectionType(rawValue: DetailSection.ItemSectiontype.banner.rawValue)
        static let storyMedia = DetailSectionType(rawValue: DetailSection.ItemSectiontype.storyMedia.rawValue)
        static let storyContributor = DetailSectionType(rawValue: DetailSection.ItemSectiontype.storyContributor.rawValue)
        static let thankYou = DetailSectionType(rawValue: DetailSection.ItemSectiontype.thankYou.rawValue)
        static let organization = DetailSectionType(rawValue: DetailSection.ItemSectiontype.organization.rawValue)
        static let wtmDescription = DetailSectionType(rawValue: DetailSection.ItemSectiontype.wtmDescription.rawValue)
        static let theme = DetailSectionType(rawValue: DetailSection.ItemSectiontype.theme.rawValue)
    }
}
