//
//  ViewController.swift
//  CollectionViewHeaderDemo
//
//  Created by Mufakkharul Islam Nayem on 5/4/20.
//  Copyright © 2020 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "FriendCell", bundle: nil), forCellWithReuseIdentifier: "FriendCell")
        collectionView.register(UINib(nibName: "FamilyCell", bundle: nil), forCellWithReuseIdentifier: "FamilyCell")
        collectionView.register(UINib(nibName: "FriendHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FriendHeaderView")
        collectionView.register(UINib(nibName: "FamilyHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FamilyHeaderView")
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items[section].rowCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.items[indexPath.section]
        
        switch item.type {
        case .friends:
            // return friends cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
            return cell
        case .families:
            // return families cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FamilyCell", for: indexPath) as! FamilyCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let item = viewModel.items[indexPath.section]
            
            switch item.type {
            case .friends:
                let friendHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FriendHeaderView", for: indexPath) //as! FriendHeaderView
                return friendHeader
            case .families:
                let friendHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FamilyHeaderView", for: indexPath) //as! FamilyHeaderView
                return friendHeader
            }
        default:
            assert(false, "Invalid element type")
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfItemsInRow: CGFloat = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let leftRightInset = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let totalSpace = leftRightInset + (flowLayout.minimumInteritemSpacing * noOfItemsInRow - 1)

        let width = (collectionView.bounds.width - totalSpace) / noOfItemsInRow
        
        return CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: collectionView.bounds.width, height: 100)
        return size
    }
    
}
