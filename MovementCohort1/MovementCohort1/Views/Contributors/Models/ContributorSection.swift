import Foundation

struct ContributorSection: Hashable {
    let id = UUID()
    
    let type: ContributorSectionType
    let title: String
    let subtitle: String
    let items: [ContributorItem]
    
    init(type: ContributorSectionType, title: String = "", subtitle: String = "", items: [ContributorItem] = []) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum Contributor: String {
        case list
        case grid
    }
}

struct ContributorSectionType: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let list = ContributorSectionType(rawValue: ContributorSection.Contributor.list.rawValue)
    static let grid = ContributorSectionType(rawValue: ContributorSection.Contributor.grid.rawValue)
}
