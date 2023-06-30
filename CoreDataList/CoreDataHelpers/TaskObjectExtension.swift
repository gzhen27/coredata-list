//
//  TaskObjectExtension.swift
//  CoreDataList
//
//  Created by G Zhen on 6/20/23.
//

import SwiftUI
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
    
    enum Difficulty: String, CaseIterable, Equatable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        
        var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    }
}

extension TaskObject {
    static var tasks: NSFetchRequest<TaskObject> {
        let request = TaskObject.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.createdAt, ascending: false)]
        
        return request
    }
}
