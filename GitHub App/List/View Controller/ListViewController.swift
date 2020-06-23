//
//  ListViewController.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit

final class ListViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        subscribeRx()
        
        recoverFromCachedData()
    }
    
    internal var viewModel = ListViewModel()
    
    private func recoverFromCachedData() {
        
        if let savedData = try? PersistenceManager.shared.context.fetch(Repository.fetchRequest()) as? [Repository] {
            
            viewModel.collectionData = savedData
            collectionView.reloadData()
        }
    }
    
    internal func clearCacheForRequest() {

        PersistenceManager.shared.clearCache()
        viewModel.collectionData = []
        collectionView.reloadData()
    }
}
