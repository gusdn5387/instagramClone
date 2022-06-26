//
//  FeedInput.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/27.
//

import Foundation

struct FeedInput: Encodable {
    let limit: Int
    let page: Int
}
