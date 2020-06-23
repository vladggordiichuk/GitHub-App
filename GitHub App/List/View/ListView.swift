//
//  ListView.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage

extension ListViewController {
    
    internal func setUpElements() {
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        collectionView.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: RepoCollectionViewCell.reuseIdentifier)
        
        
        navigationItem.title = String(format: "GitHub Browser")
        
        navigationItem.searchController = UISearchController()
        definesPresentationContext = true
        navigationItem.searchController?.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController?.searchBar.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(askToClearCache))
    }
    
    @objc private func askToClearCache() {
        
        let alertController = UIAlertController(
            title: "Delete all cache",
            message: "Are you sure you want to drop local database and image cache?",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Clear Cache", style: .destructive, handler: { [weak self] _ in
            
            SDImageCache.shared.clearMemory()
            SDImageCache.shared.clearDisk()
            
            self?.clearCacheForRequest()
        }))
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { _ in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
}
