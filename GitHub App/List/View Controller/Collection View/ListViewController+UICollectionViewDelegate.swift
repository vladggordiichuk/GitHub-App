//
//  ListViewController+UICollectionViewDelegate.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit

extension ListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let repo = viewModel.collectionData[indexPath.row]
        let viewController = DetailsViewController(with: repo)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
