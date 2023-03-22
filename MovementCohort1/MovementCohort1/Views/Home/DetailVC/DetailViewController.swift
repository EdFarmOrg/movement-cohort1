//
//  ViewController.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/9/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<DetailSection, DetailItem>!
    let background = "background-element-kind"

    
    lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [ weak self ] (sectionIndex, enviroment) ->
            NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header: return HomeDetailLayoutSectionFactory.header()
            case .banner: return HomeDetailLayoutSectionFactory.banner()
            case .storyContributor: return HomeDetailLayoutSectionFactory.storyContributor()
//            case .storyMedia: return HomeDetailLayoutSectionFactory.storyMedia()
            default: return nil
            }
        }
        //Register Story Media background view
//        layout.register(MediaBackgroundView.self, forDecorationViewOfKind: background)
        layout.register(ContributorBackgroundView.self, forDecorationViewOfKind: background)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
    }
    
    private func initalize() {
        setUpCollectionView()
        configureDataSource()
        configureSupplementaryView()
    }
    
    private func setUpCollectionView() {
        collectionView.register(DetailHeaderCell.nib, forCellWithReuseIdentifier: DetailHeaderCell.reuseIdentifer)
        collectionView.register(BannerCell.nib, forCellWithReuseIdentifier: BannerCell.reuseIdentifer)
//        collectionView.register(StoryMediaCell.nib, forCellWithReuseIdentifier: StoryMediaCell.reuseIdentifer)
////        Story Media Header
//        collectionView.register(MediaHeader.nib, forSupplementaryViewOfKind: MediaHeader.kind, withReuseIdentifier: MediaHeader.reuseIdentifer)
        collectionView.register(StoryContributorCell.nib, forCellWithReuseIdentifier: StoryContributorCell.reuseIdentifer)
        collectionView.register(ContributorHeader.nib, forSupplementaryViewOfKind: ContributorHeader.kind, withReuseIdentifier: ContributorHeader.reuseIdentifer)
        
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<DetailSection, DetailItem>(collectionView: collectionView) { [ weak self ]
            (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderCell.reuseIdentifer, for: indexPath)
                return cell
            case .banner:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseIdentifer, for: indexPath)
                return cell
//            case .storyMedia:
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryMediaCell.reuseIdentifer, for: indexPath)
//                return cell
            case .storyContributor:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryContributorCell.reuseIdentifer, for: indexPath)
                return cell
            default:
                return nil
            }
        }
        
        let sections = [
            DetailSection(type: .header, items: [
            DetailItem()
            ]),
            DetailSection(type: .banner, items: [
            DetailItem()
            ]),
            DetailSection(type: .storyContributor, items: [
            DetailItem()
            ])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<DetailSection, DetailItem>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureSupplementaryView() {
        dataSource.supplementaryViewProvider = { [ weak self ]
            (collectionView, kind, indexPath) in
            guard let self = self else { return
                UICollectionReusableView() }
            
            let snapshot = self.dataSource.snapshot()
            let sectionKind = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionKind {
//            case .storyMedia:
//                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: MediaHeader.kind, withReuseIdentifier: MediaHeader.reuseIdentifer, for: indexPath)
//                return sectionHeader
            case .storyContributor:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: ContributorHeader.kind, withReuseIdentifier: ContributorHeader.reuseIdentifer, for: indexPath)
                return sectionHeader
                
            default: return nil
            }
        }
    }
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct DetailViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController()!
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct HomeDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        DetailViewControllerRepresentable()
    }
}
#endif
