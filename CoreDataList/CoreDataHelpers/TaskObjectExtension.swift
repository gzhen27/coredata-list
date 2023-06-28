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
    
    var getCreatedAt: String {
        guard let createdAt = createdAt else { return "N/A"}
        
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateStyle = .short
        localDateFormatter.timeStyle = .short
        
        return localDateFormatter.string(from: createdAt)
    }
}

extension TaskObject {
    static var topFiveTasks: NSFetchRequest<TaskObject> {
        let request = TaskObject.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.name, ascending: true)]
        
        return request
    }
}
