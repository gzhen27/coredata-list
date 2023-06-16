//
//  TasksContainer.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import CoreData

class TasksContainer {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Tasks")
        persistentContainer.loadPersistentStores { _, _ in
            // handling errors
        }
    }
}
