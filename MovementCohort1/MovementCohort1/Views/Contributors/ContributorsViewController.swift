import UIKit

enum ListType {
    case grid
    case list
}

class ContributorsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnListGrid: UIButton!
   
    private var listType: ListType = .list
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    private var sections: [Section] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .grid: return LayoutSectionFactory.grid()
            case .list: return LayoutSectionFactory.list()
            default: return nil
            }
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    private func initialize() {
        setupCollectionView()
        configureDataSource()
        createListData()
    }
    
    private func setupCollectionView() {
        let cells: [RegisterableView] = [
            .nib(ContributorCell.self),
            .nib(ContributorGridCell.self)
        ]
        
        collectionView.register(cells: cells)
        collectionView.register(ContributorCell.nib, forSupplementaryViewOfKind: ContributorCell.kind, withReuseIdentifier: ContributorCell.reuseIdentifier)
        collectionView.register(ContributorGridCell.nib, forSupplementaryViewOfKind: ContributorGridCell.kind, withReuseIdentifier: ContributorGridCell.reuseIdentifier)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func createListData() {
        sections = [
            Section(type: .list, items: [
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item()
            ])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func createGridData() {
        sections = [
            Section(type: .grid, items: [
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item(),
                Item(), Item(), Item(), Item()
            ])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContributorCell.reuseIdentifier, for: indexPath)
                return cell
            }
        }
    }
    
    @IBAction func onListSwitchTapped(_ sender: Any) {
        if listType == .list {
            listType = .grid
            btnListGrid.image = UIImage(named: )
            createListData()
        } else {
            listType = .list
            btnListGrid.image = UIImage(named: )
            createGridData()
        }
    }
    
    
    
    
    
}




























#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ContributorsViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Contributors", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContributorsViewController_Preview: PreviewProvider {
    static var previews: some View {
        ContributorsViewControllerRepresentable()
    }
}
#endif
