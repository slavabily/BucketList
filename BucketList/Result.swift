//
//  Result.swift
//  BucketList
//
//  Created by slava bily on 8/5/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
