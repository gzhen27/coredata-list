//
//  TaskCreationView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/16/23.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.managedObjectContext)
    private var managedObjectContext
    
    @State
    private var name = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    @State
    private var dueOn = Date()
    
    var body: some View {
        VStack {
            HeaderView(content: "Create Task")
            TaskInfoForm(name: $name, difficulty: $difficulty, dueOn: $dueOn, type: .create, createdAt: nil, modifiedAt: nil)
            Spacer()
            SaveButtonView(task: nil, taskInfo: Task(name: name, difficulty: difficulty, dueOn: dueOn))
        }
        .padding(.horizontal)
        .presentationCornerRadius(8)
    }
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
