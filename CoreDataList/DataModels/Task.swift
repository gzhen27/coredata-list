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
    let isLike: Bool
    let isCompleted: Bool
    let createdAt: Date
    let modifiedAt: Date
    let dueOn: Date
    
    init(name: String, difficulty: String, isLike: Bool = false, isCompleted: Bool = false, createdAt: Date = Date(), modifiedAt: Date = Date(), dueOn: Date = Date()) {
        self.name = name
        self.difficulty = difficulty
        self.isLike = isLike
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.dueOn = dueOn
    }
}
