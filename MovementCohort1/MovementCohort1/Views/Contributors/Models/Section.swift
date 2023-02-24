import Foundation

struct Section: Hashable {
    let id = UUID()
    
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]
    
    init(type: SectionType, title: String = "", subtitle: String = "", items: [Item] = []) {
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

struct SectionType: RawRepresentable, Hashable {
    typealias RawValue = String
    var rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let list = SectionType(rawValue: Section.Contributor.list.rawValue)
    static let grid = SectionType(rawValue: Section.Contributor.grid.rawValue)
}
