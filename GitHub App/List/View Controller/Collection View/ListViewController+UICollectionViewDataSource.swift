//
//  ListViewController+UICollectionViewDataSource.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit

extension ListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.collectionData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepoCollectionViewCell.reuseIdentifier, for: indexPath) as! RepoCollectionViewCell
        cell.fill(with: viewModel.collectionData[indexPath.row])
        return cell
    }
}
