import UIKit

enum ListType {
    case grid
    case list
}

class ContributorsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnListGrid: UIButton!
    
    private var listType: ListType = .list
    private var dataSource: UICollectionViewDiffableDataSource<ContributorSection, ContributorItem>!
    private var snapshot = NSDiffableDataSourceSnapshot<ContributorSection, ContributorItem>()
    private var sections: [ContributorSection] = []
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
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
        //btnListGrid.isHidden = false
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
            ContributorSection(type: .list, items: [
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem(),
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem(),
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem()
            ])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<ContributorSection, ContributorItem>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func createGridData() {
        sections = [
            ContributorSection(type: .grid, items: [
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem(),
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem(),
                ContributorItem(), ContributorItem(), ContributorItem(), ContributorItem()
            ])
        ]
        
        snapshot = NSDiffableDataSourceSnapshot<ContributorSection,ContributorItem>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ContributorSection, ContributorItem>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .list:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContributorCell.reuseIdentifier, for: indexPath)
                return cell
            case.grid:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContributorGridCell.reuseIdentifier, for: indexPath)
                return cell
            default: return nil
            }
        }
    }
    
    @IBAction func onListSwitchTapped(_ sender: Any) {
        if listType == .list {
            listType = .grid
            btnListGrid.setImage(UIImage(systemName: "rectangle.grid.1x2.fill"  ), for: .normal)
            createGridData()
            btnListGrid.isHidden = false
            
        } else {
            
            listType = .list
            btnListGrid.setImage(UIImage(systemName: "square.grid.2x2.fill" ), for: .normal)
            createListData()
            btnListGrid.isHidden = false
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
