//
//  Task.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import Foundation

struct Task {
    let name: String
    let difficulty: String
    let isLike: Bool = false
    let createdAt: Date = Date.now
    let modifiedAt: Date = Date.now
}
