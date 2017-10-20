//
//  CacheableOf.swift
//  Top Repos
//
//  Created by Ben Scheirman on 10/17/17.
//  Copyright © 2017 NSScreencast. All rights reserved.
//

import Foundation

enum ResponseType {
    case cached
    case fresh
}

struct CacheableOf<T : Equatable> {
    let object: T
    let responseType: ResponseType
}

func Cached<T>(_ object: T) -> CacheableOf<T> {
    return CacheableOf(object: object, responseType: .cached)
}

func Fresh<T>(_ object: T) -> CacheableOf<T> {
    return CacheableOf(object: object, responseType: .fresh)
}
