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
    
    @FetchRequest<TaskType>(sortDescriptors: [])
    private var taskTypes
    
    @State
    private var name = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    @State
    private var dueOn = Date()
    
    @State
    private var typeName: String = ""
    
    var body: some View {
        VStack {
            HeaderView(content: "Create Task")
            TaskInfoForm(name: $name, difficulty: $difficulty, dueOn: $dueOn, typeName: $typeName, taskTypeObject: nil, type: .create, createdAt: nil, modifiedAt: nil)
            Spacer()
            SaveButtonView(typeName: $typeName, task: nil, taskInfo: createTypeInfo(typeName: typeName, types: taskTypes, moc: managedObjectContext, name: name, difficulty: difficulty, dueOn: dueOn), action: .create)
        }
        .padding(.horizontal)
        .presentationCornerRadius(8)
    }
}

//Preview BUG - crashed preview with creating type info
//struct TaskCreationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTaskView()
//    }
//}
