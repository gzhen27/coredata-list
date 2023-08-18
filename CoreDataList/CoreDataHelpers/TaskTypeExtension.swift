//
//  TaskTypeExtension.swift
//  CoreDataList
//
//  Created by G Zhen on 7/15/23.
//

import Foundation

extension TaskType {
    var getName: String {
        name ?? "Unknown"
    }
    
    // MARK: - For Relationship tables
    var getTasks: [TaskObject] {
        // convert NSSet to Array
        taskObjects?.array as? [TaskObject] ?? []
    }
    
    var getSortedTasks: [TaskObject] {
        return getTasks.sorted { $0.getName.uppercased() < $1.getName.uppercased() }
    }
}
