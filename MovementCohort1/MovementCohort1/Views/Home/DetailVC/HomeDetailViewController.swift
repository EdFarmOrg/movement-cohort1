//
//  ViewController.swift
//  MovementCohort1
//
//  Created by Zachary Farmer on 3/9/23.
//

import UIKit

class HomeDetailViewController: UIViewController, Storyboarded {
    var selectedItemIndex: Int = 0
    func start() {

    }

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<DetailSection, DetailItem>!
    let background = "background-element-kind"
    var section: HomeSection?
    
    lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [ weak self ] (sectionIndex, enviroment) ->
            NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header: return HomeDetailLayoutSectionFactory.header()
            case .banner: return HomeDetailLayoutSectionFactory.banner()
            case .storyMedia: return HomeDetailLayoutSectionFactory.storyMedia()
            case .storyContributor: return HomeDetailLayoutSectionFactory.storyContributor()
            case .thankYou: return HomeDetailLayoutSectionFactory.thankYou()
            case .organization: return HomeDetailLayoutSectionFactory.organization()
            case .wtmDescription: return HomeDetailLayoutSectionFactory.wtmDescription()
            case .theme: return HomeDetailLayoutSectionFactory.theme()
            default: return nil
            }
        }
        
        //Register background view
        layout.register(MediaBackgroundView.self, forDecorationViewOfKind: background)

        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
    }
    
    //MARK: Initialize
    private func initalize() {
        setUpCollectionView()
        configureDataSource()
        configureSupplementaryView()
    }
    
    //MARK: Setup CollectionView
    private func setUpCollectionView() {
        collectionView.register(DetailHeaderCell.nib, forCellWithReuseIdentifier: DetailHeaderCell.reuseIdentifer)
        collectionView.register(BannerCell.nib, forCellWithReuseIdentifier: BannerCell.reuseIdentifer)
        collectionView.register(StoryMediaCell.nib, forCellWithReuseIdentifier: StoryMediaCell.reuseIdentifer)
        collectionView.register(StoryContributorCell.nib, forCellWithReuseIdentifier: StoryContributorCell.reuseIdentifer)
        collectionView.register(ThankYouCell.nib, forCellWithReuseIdentifier: ThankYouCell.reuseIdentifer)
        collectionView.register(OrganizationCell.nib, forCellWithReuseIdentifier: OrganizationCell.reuseIdentifer)
        collectionView.register(WTMDescriptionCell.nib, forCellWithReuseIdentifier: WTMDescriptionCell.reuseIdentifer)
        collectionView.register(ThemeCell.nib, forCellWithReuseIdentifier: ThemeCell.reuseIdentifer)
        
        // Story Header
        collectionView.register(StoryHeader.nib, forSupplementaryViewOfKind: StoryHeader.kind, withReuseIdentifier: StoryHeader.reuseIdentifer)
        
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    //MARK: ConfigureDataSource
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
            case .storyMedia:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryMediaCell.reuseIdentifer, for: indexPath)
                return cell
            case .storyContributor:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryContributorCell.reuseIdentifer, for: indexPath)
                return cell
            case .thankYou:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThankYouCell.reuseIdentifer, for: indexPath)
                return cell
            case .organization:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrganizationCell.reuseIdentifer, for: indexPath)
                return cell
            case .wtmDescription:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WTMDescriptionCell.reuseIdentifer, for: indexPath)
                return cell
            case .theme:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCell.reuseIdentifer, for: indexPath)
                return cell
            default:
                return nil
            }
        }
        
        //MARK: CollectionView Sections
        let sections = [
            DetailSection(type: .header, items: [
            DetailItem()
            ]),
            DetailSection(type: .banner, items: [
            DetailItem()
            ]),
            DetailSection(type: .storyMedia, items: [
            DetailItem(), DetailItem(), DetailItem(),
            DetailItem(), DetailItem(), DetailItem(),
            DetailItem(), DetailItem(), DetailItem(),
            DetailItem()
            ]),
            DetailSection(type: .storyContributor, items: [
            DetailItem(), DetailItem()
            ]),
            DetailSection(type: .thankYou, items: [
            DetailItem()
            ]),
            DetailSection(type: .wtmDescription, items: [
            DetailItem()
            ]),
            DetailSection(type: .organization, items: [
            DetailItem(), DetailItem()
            ]),
            DetailSection(type: .theme, items: [
            DetailItem(), DetailItem(), DetailItem()
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
            case .storyMedia:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: StoryHeader.kind, withReuseIdentifier: StoryHeader.reuseIdentifer, for: indexPath) as! StoryHeader
                sectionHeader.configure(with: "STORY", and: "Media")
                return sectionHeader
                
            case .storyContributor:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: StoryHeader.kind, withReuseIdentifier: StoryHeader.reuseIdentifer, for: indexPath) as! StoryHeader
                sectionHeader.configure(with: "STORY", and: "Contributors")
                return sectionHeader
                
            case .wtmDescription:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: StoryHeader.kind, withReuseIdentifier: StoryHeader.reuseIdentifer, for: indexPath) as! StoryHeader
                sectionHeader.configure(with: "WHAT'S THE", and: "Move")
                return sectionHeader
                
            case .theme:
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: StoryHeader.kind, withReuseIdentifier: StoryHeader.reuseIdentifer, for: indexPath) as! StoryHeader
                sectionHeader.configure(with: "STORT", and: "Themes")
                return sectionHeader
                
            default: return nil
            }
        }
    }
}





#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeDetailViewControllerRepresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController()!
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct HomeDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeDetailViewControllerRepresentable()
    }
}
#endif
