//
//  TaskHelpers.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI
import CoreData

func saveTask(task: FetchedResults<TaskObject>.Element? = nil, taskInfo: Task, moc: NSManagedObjectContext) {
    if let task = task {
        task.name = taskInfo.name
        task.difficulty = taskInfo.difficulty
        task.modifiedAt = taskInfo.modifiedAt
    } else {
        let task = TaskObject(context: moc)
        task.name = taskInfo.name
        task.difficulty = taskInfo.difficulty
        task.isLike = taskInfo.isLike
        task.createdAt = taskInfo.createdAt
    }
    try? moc.save()
}
