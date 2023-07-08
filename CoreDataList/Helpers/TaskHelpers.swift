//
//  TaskHelpers.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI
import CoreData

func saveTask(task: FetchedResults<TaskObject>.Element, taskInfo: Task, moc: NSManagedObjectContext) {
    task.name = taskInfo.name
    task.difficulty = taskInfo.difficulty
    task.isLike = taskInfo.isLike
    task.modifiedAt = taskInfo.modifiedAt
    task.dueOn = taskInfo.dueOn
    
    if moc.hasChanges {
        do {
            try moc.save()
        } catch let e as CocoaError {
            let errDict = e.userInfo
            if let conflictList = errDict[NSPersistentStoreSaveConflictsErrorKey] {
                let constraintConflicts = conflictList as! [NSConstraintConflict]
                
                for conflict in constraintConflicts {
                    for (_, value) in conflict.constraintValues {
                        print("The task \(value) is already exists.")
                    }
                }
            }
            moc.delete(task)
        } catch {
            print("Errors occurred: \(error.localizedDescription)")
        }
    }
}
