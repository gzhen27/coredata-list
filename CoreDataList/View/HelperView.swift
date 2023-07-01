//
//  HelperView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import SwiftUI
import CoreData

func closeBtn(dismiss: DismissAction) -> some View {
    return HStack {
        Spacer()
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.title3)
        }
    }
}

func customHeaderSection(text content: String) -> some View {
    HStack {
        Text(content)
            .font(.largeTitle)
            .bold()
        Spacer()
    }
    .padding(.bottom, 36)
}

func saveTaskbtn(task: FetchedResults<TaskObject>.Element?, taskInfo: Task, moc: NSManagedObjectContext, dismiss: DismissAction) -> some View{
    Button {
        saveTask(task: task, taskInfo: taskInfo, moc: moc)
        dismiss()
    } label: {
        Text("Save")
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
    }
}

func saveTask(task: FetchedResults<TaskObject>.Element?, taskInfo: Task, moc: NSManagedObjectContext) {
    if let task = task {
        task.name = taskInfo.name
        task.difficulty = taskInfo.difficulty
    } else {
        let task = TaskObject(context: moc)
        task.name = taskInfo.name
        task.difficulty = taskInfo.difficulty
        task.isLike = taskInfo.isLike
        task.createdAt = taskInfo.createdAt
    }
    try? moc.save()
}
