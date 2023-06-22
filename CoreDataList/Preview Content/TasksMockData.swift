//
//  TasksMockData.swift
//  CoreDataList
//
//  Created by G Zhen on 6/20/23.
//

import CoreData

extension TasksContainer {
    static var previewContext: NSManagedObjectContext {
        let persistentContainer = NSPersistentContainer(name: "Tasks")
        persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        persistentContainer.loadPersistentStores { _, _ in }
        addMockData(moc: persistentContainer.viewContext)
        return persistentContainer.viewContext
    }
    
    static func addMockData(moc: NSManagedObjectContext) {
        let task1 = TaskObject(context: moc)
        task1.name = "First Task"
        task1.createdAt = Date.now
        
        let task2 = TaskObject(context: moc)
        task2.name = "Second Task"
        task2.createdAt = Date.now.addingTimeInterval(60)
    
        _ = TaskObject(context: moc)
        
        try? moc.save()
    }
}
