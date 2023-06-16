//
//  TaskContainer.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import CoreData

class TaskContainer {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Task")
        persistentContainer.loadPersistentStores { _, _ in
            // handling errors
        }
    }
}
