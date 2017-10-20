//
//  RepositoryList.swift
//  Top Repos
//
//  Created by Ben Scheirman on 10/17/17.
//  Copyright © 2017 NSScreencast. All rights reserved.
//

import Foundation

struct RepositoryList : Codable {
    let repos: [Repository]
}

extension RepositoryList : Equatable {
    static func ==(lhs: RepositoryList, rhs: RepositoryList) -> Bool {
        return lhs.repos == rhs.repos
    }
}
