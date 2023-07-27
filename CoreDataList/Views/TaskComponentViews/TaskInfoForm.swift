//
//  TaskInfoForm.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI

struct TaskInfoForm: View {
    @Binding
    var name: String
    
    @Binding
    var difficulty: String
    
    @Binding
    var dueOn: Date
    
    @Binding
    var typeName: String
    
    let taskTypeObject: FetchedResults<TaskType>.Element?
    
    let type: SaveAction
    let createdAt: String?
    let modifiedAt: String?
    
    var body: some View {
        VStack {
            TextFieldView(name: $name, type: type, title: "Name the task:", placeholder: "enter the task name")
                .padding(.bottom)
            DifficultyPickerView(difficulty: $difficulty)
                .padding(.bottom)
            DueDatePicker(dueOn: $dueOn)
                .padding(.bottom)
            TextFieldView(name: $typeName, type: type, title: "Task Type:", placeholder: "enter the task type")
                .padding(.bottom)
            Group {
                if let createdAt = createdAt {
                    HStack {
                        Text("Created At:")
                            .font(.headline)
                        Spacer()
                        Text(createdAt)
                        
                    }
                    .padding(.bottom)
                }
                if let modifiedAt = modifiedAt {
                    HStack {
                        Text("Last modified:")
                            .font(.headline)
                        Spacer()
                        Text(modifiedAt)
                        
                    }
                    .padding(.bottom)
                }
            }
        }
        .onAppear {
            if let type = taskTypeObject {
                typeName = type.getName
            }
        }
    }
}

struct TaskInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TaskInfoForm(name: .constant("Task name"), difficulty: .constant("Easy"), dueOn: .constant(Date()), typeName: .constant("New"), taskTypeObject: createPreviewTaskType(), type: .create, createdAt: "unknown", modifiedAt: "unknown")
                .padding()
            Spacer()
        }
    }
    
    static func createPreviewTaskType() -> FetchedResults<TaskType>.Element {
        let context = TasksContainer().persistentContainer.viewContext
        let type = TaskType(context: context)
        type.name = "New Task"
        
        return type
    }
}
