//
//  TasksContainer.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import CoreData

class TasksContainer {
    let persistentContainer: NSPersistentContainer
    
    init(devMode: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "Tasks")
        
        if devMode {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, _ in
            // handling errors
        }
        
        if devMode {
            TasksContainer.addMockData(moc: persistentContainer.viewContext)
        }
    }
}
