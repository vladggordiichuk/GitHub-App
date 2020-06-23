//
//  ListViewController+UISearchResultsUpdating.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard searchText != "" else { return }
        
        clearCacheForRequest()
        
        viewModel.fetchRepositories(with: searchText)
    }
}
