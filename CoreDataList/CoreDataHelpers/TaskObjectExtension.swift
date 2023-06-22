//
//  TaskObjectExtension.swift
//  CoreDataList
//
//  Created by G Zhen on 6/20/23.
//

import Foundation

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
