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
    
    var task: FetchedResults<TaskObject>.Element
    
    @State
    private var name = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    var body: some View {
        VStack {
            HeaderView(content: "Edit Task")
            TaskInfoForm(name: $name, difficulty: $difficulty, type: .edit)
            Spacer()
            SaveButtonView(task: task, taskInfo: Task(name: name, difficulty: difficulty))
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            difficulty = task.getDifficulty
            name = task.getName
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