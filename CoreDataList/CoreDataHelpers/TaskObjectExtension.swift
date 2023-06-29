//
//  TaskObjectExtension.swift
//  CoreDataList
//
//  Created by G Zhen on 6/20/23.
//

import Foundation
import CoreData

extension TaskObject {
    var getName: String {
        name ?? "Unknown"
    }
    
    var getDifficulty: String {
        difficulty ?? "Unknown"
    }
    
    var getCreatedAt: String {
        guard let createdAt = createdAt else { return "N/A"}
        
        return createdAt.formatted(date: .numeric, time: .omitted)
    }
}

extension TaskObject {
    static var tasks: NSFetchRequest<TaskObject> {
        let request = TaskObject.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.difficulty, ascending: true)]
        
        return request
    }
}
