//
//  Repository.swift
//  Top Repos
//
//  Created by Ben Scheirman on 10/11/17.
//  Copyright © 2017 NSScreencast. All rights reserved.
//

import Foundation

struct Repository : Codable {
    let id: Int
    let name: String
    let description: String
    let stargazersCount: Int
    let forksCount: Int
    let owner: User
    let url: URL
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case owner
        case url
    }
}

extension Repository : Equatable {
    static func ==(lhs: Repository, rhs: Repository) -> Bool {
        return (
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.description == rhs.description &&
            lhs.stargazersCount == rhs.stargazersCount &&
            lhs.forksCount == rhs.forksCount &&
            lhs.owner == rhs.owner &&
            lhs.url == rhs.url
        )
    }
}

