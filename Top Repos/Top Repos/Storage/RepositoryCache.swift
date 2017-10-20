//
//  RepositoryCache.swift
//  Top Repos
//
//  Created by Ben Scheirman on 10/17/17.
//  Copyright © 2017 NSScreencast. All rights reserved.
//

import Foundation

class RepositoryCache : LocalJSONStore<RepositoryList> {
    init() {
        super.init(storageType: .cache, filename: "repos.json")
    }
}
