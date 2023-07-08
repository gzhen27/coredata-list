//
//  TaskHelpers.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI
import CoreData


enum SaveAction {
    case create
    case edit
}

enum SaveResult {
    case success
    case failure
}

// BUG: -- when updating a task with the exist name, the tasks on the view will be mess up.
func saveTask(task: FetchedResults<TaskObject>.Element, taskInfo: Task, moc: NSManagedObjectContext) -> (SaveResult, String) {
    task.name = taskInfo.name
    task.difficulty = taskInfo.difficulty
    task.isLike = taskInfo.isLike
    task.modifiedAt = taskInfo.modifiedAt
    task.dueOn = taskInfo.dueOn
    var saveMessage = ""
    
    if moc.hasChanges {
        do {
            try moc.save()
        } catch let e as CocoaError {
            let errDict = e.userInfo
            if let conflictList = errDict[NSPersistentStoreSaveConflictsErrorKey] {
                let constraintConflicts = conflictList as! [NSConstraintConflict]
                
                for conflict in constraintConflicts {
                    for (_, value) in conflict.constraintValues {
                        //Currently only the name field is in constraints. We are safe to use this in the for in loop.
                       saveMessage = "The task \(value) is already exists."
                    }
                }
            }
            moc.delete(task)
            return (SaveResult.failure, saveMessage)
        } catch {
            saveMessage = "Errors occurred: \(error.localizedDescription)"
            return (SaveResult.failure, saveMessage)
        }
    }
    
    return (SaveResult.success, saveMessage)
}
