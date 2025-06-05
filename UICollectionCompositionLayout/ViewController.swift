//
//  ViewController.swift
//  UICollectionCompositionLayout
//
//  Created by Авазбек Надырбек уулу on 05.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 Model
    // 2 Collection
    // 3 DataSource
    // 5 Cells
    
    let data = CollectionSection.mockData()
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseIdentifier)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseIdentifier)
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseIdentifier)
        $0.register(BigIMG.self, forCellWithReuseIdentifier: BigIMG.reuseIdentifier)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: setLayout()))
    
    private func setLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                return self.setStorySection()
            case 1:
                return self.setMessageSection()
            case 2:
                return self.setNewsSection()
            default:
                return self.setBigImg()
            }
        }
    }
    
    // story section
    private func setStorySection() -> NSCollectionLayoutSection {
        // creating item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // creating a groupSize
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        // creating a section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 0)
        return section
    }
    
    //Message section
    private func setMessageSection() -> NSCollectionLayoutSection {
        // create item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        // creating a groupSize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .estimated(98))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    private func setNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.80), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 20, leading: -15, bottom: 20, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    private func setBigImg() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
        
        return section
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .red
    }

}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.section].items[indexPath.item]
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseIdentifier, for: indexPath) as! StoryCell
            cell.setUpCell(item: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseIdentifier, for: indexPath) as! MessageCell
            cell.setUpCell(item: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseIdentifier, for: indexPath) as! NewsCell
            cell.setUpCell(item: item)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigIMG.reuseIdentifier, for: indexPath) as! BigIMG
            cell.setUpCell(item: item)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    

}
