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
        task1.createdAt = Date.now.addingTimeInterval(-270000)
        task1.modifiedAt = Date.now.addingTimeInterval(-270000)
        task1.dueOn = Date.now.addingTimeInterval(270000)
        task1.isLike = true
        task1.difficulty = "Easy"
        
        let task2 = TaskObject(context: moc)
        task2.name = "Second Task"
        task2.createdAt = Date.now.addingTimeInterval(-160000)
        task2.modifiedAt = Date.now.addingTimeInterval(-160000)
        task2.dueOn = Date.now.addingTimeInterval(160000)
        task2.difficulty = "Hard"
        
        let task3 = TaskObject(context: moc)
        task3.name = "Third Task"
        task3.createdAt = Date.now.addingTimeInterval(-70000)
        task3.modifiedAt = Date.now.addingTimeInterval(-70000)
        task3.dueOn = Date.now.addingTimeInterval(70000)
        task3.isLike = true
        task3.difficulty = "Easy"
        
        let task4 = TaskObject(context: moc)
        task4.name = "Fourth Task"
        task4.createdAt = Date.now
        task4.modifiedAt = Date.now
        task4.dueOn = Date.now
        task4.isLike = true
        task4.difficulty = "Hard"
        
        try? moc.save()
    }
}
