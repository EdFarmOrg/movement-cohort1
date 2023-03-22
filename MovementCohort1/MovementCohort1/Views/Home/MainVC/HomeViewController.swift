//
//  HomeViewController.swift
//  MovementCohort1
//
//  Created by Craig Clayton on 1/30/23.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<HomeSection, HomeItem>!
    let background = "background-element-kind"
    
    lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [ weak self ] (sectionIndex, enviroment) ->
            NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header : return HomeLayoutSectionFactory.scroller()
            case .card : return HomeLayoutSectionFactory.card()
            case .filter : return HomeLayoutSectionFactory.filter()
            default: return nil
            }
        }
        layout.register(FilterBackgroundView.self, forDecorationViewOfKind: background)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func start() {
    }
    
    //MARK: Initialize
    private func initialize() {
        setUpCollectionViews()
        configureDataSource()
        configureSupplementaryView()
    }
    //MARK: Setup CollectionView
    private func setUpCollectionViews() {
        collectionView.register(HomeHeaderCell.nib, forCellWithReuseIdentifier: HomeHeaderCell.reuseIdentifer)
        collectionView.register(FilterCell.nib, forCellWithReuseIdentifier: FilterCell.reuseIdentifer)
        collectionView.register(HomeCardCell.nib, forCellWithReuseIdentifier: HomeCardCell.reuseIdentifer)
        // Filter Section Supplementary View
        collectionView.register(FilterHeader.nib, forSupplementaryViewOfKind: FilterHeader.kind, withReuseIdentifier: FilterHeader.reuseIdentifer)
        
        collectionView.collectionViewLayout = collectionViewLayout
        
    }
    //MARK: Config CollectionView
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<HomeSection, HomeItem>(collectionView: collectionView) { [weak self]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.reuseIdentifer, for: indexPath)
                return cell
            case .filter:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.reuseIdentifer, for: indexPath)
                return cell
            case .card:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCardCell.reuseIdentifer, for: indexPath)
                return cell
            default:
                return nil
            }
        }
        //MARK: CollectionView Sections
            let sections = [
                HomeSection(type: .header, items: [
                HomeItem()
                ]),
                HomeSection(type: .filter, items: [
                HomeItem(), HomeItem(), HomeItem(), HomeItem(),
                HomeItem(), HomeItem(), HomeItem(), HomeItem(),
                HomeItem(), HomeItem(), HomeItem(), HomeItem(),
                HomeItem(), HomeItem(), HomeItem(), HomeItem()
                ]),
                HomeSection(type: .card, items: [
                HomeItem(), HomeItem()
                ])
            ]
        
            var snapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeItem>()
            snapshot.appendSections(sections)
            sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureSupplementaryView() {
        dataSource.supplementaryViewProvider = { [ weak self ] (collectionView, kind, indexPath) in
            guard let self = self else { return UICollectionReusableView() }

            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].type

            switch sectionKind {
            case .filter:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: FilterHeader.kind, withReuseIdentifier: FilterHeader.reuseIdentifer, for: indexPath)
                return sectionHeader

            default: return nil
            }
        }
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */





#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewControllerRepresentable()
    }
}
#endif
