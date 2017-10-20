//
//  RepositoryStore.swift
//  Top Repos
//
//  Created by Ben Scheirman on 10/17/17.
//  Copyright © 2017 NSScreencast. All rights reserved.
//

import Foundation

typealias CacheableResponseBlock<T : Equatable> = ApiResponseBlock<CacheableOf<T>>

struct RepositoryStore {
    let client: GitHubClient
    let cache = RepositoryCache()
    
    init(client: GitHubClient = GitHubClient.shared) {
        self.client = client
    }
    
    func getRepositories(forceRefresh: Bool = false, completion: @escaping CacheableResponseBlock<RepositoryList>) {
        
        var cachedData: RepositoryList?
        if !forceRefresh, let repoList = cache.storedValue {
            cachedData = repoList
            completion(.success(Cached(repoList)))
        }
        
        client.searchRepositories(term: "topic:swift") { result in
            switch result {
            case .success(let repos):
                let repoList = RepositoryList(repos: repos)
                
                if let cachedData = cachedData, cachedData == repoList {
                    // ignore
                } else {
                    self.cache.save(repoList)
                    completion(.success(Fresh(repoList)))
                }
                
            case .error(let e):
                completion(.error(e))
            }
        }
    }
}
