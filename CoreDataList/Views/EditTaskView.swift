//
//  EditTaskView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/29/23.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss)
    var dismiss
    
    @Environment(\.managedObjectContext)
    var managedObjectContext
    
    let task: FetchedResults<TaskObject>.Element
    
    @State
    private var name = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    @State
    private var dueOn = Date()
    
    @State
    private var typeName = ""
    
    var body: some View {
        VStack {
            HeaderView(content: "Edit Task")
            TaskInfoForm(name: $name, difficulty: $difficulty, dueOn: $dueOn, typeName: $typeName, taskTypeObject: task.taskType, type: .edit, createdAt: task.getCreatedAt, modifiedAt: task.getModifiedAt)
            Spacer()
            SaveButtonView(typeName: $typeName, task: task, taskInfo: Task(name: name, difficulty: difficulty, dueOn: dueOn), action: .edit)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            difficulty = task.getDifficulty
            name = task.getName
            dueOn = task.dueOn ?? Date()
        }
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: createPreviewTask())
    }

    static func createPreviewTask() -> FetchedResults<TaskObject>.Element {
        let context = TasksContainer().persistentContainer.viewContext
        let task = TaskObject(context: context)
        task.name = "Preview task"
        task.createdAt = Date.now
        task.difficulty = "easy"
        task.isLike = true

        return task
    }
}
