//
//  ListViewModel.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import RxSwift

class ListViewModel {
    
    public let disposeBag = DisposeBag()
    
    public var receivedData = PublishSubject<Bool>()
    
    private var request = RepoSearchRequest()
    
    public var collectionData = [Repository]()
    
    open func fetchRepositories(with query: String) {
        NetworkManager.shared.performRequest(to: EndpointCollection.getRepos(), with: request.withQuery(query)) { [weak self] (result: Result<RepoSearchResponse>) in
            
            switch result {
            case .success(let data):
                PersistenceManager.shared.save()
                self?.collectionData = data.items;
                self?.receivedData.onNext(true)
            case .failure(_):
                self?.fetchRepositories(with: query)
            }
        }
    }
}
