//
//  SaveButtonView.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI

struct SaveButtonView: View {
    @Environment(\.managedObjectContext)
    var managedObjectContext
    
    @Environment(\.dismiss)
    var dismiss
    
    @FetchRequest<TaskType>(sortDescriptors: [])
    private var taskTypes
    
    @State
    private var errorMessage = ""
    
    @State
    private var showErrorMessage = false
    
    @Binding
    var typeName: String
    
    let task: FetchedResults<TaskObject>.Element?
    let taskInfo: Task
    let action: SaveAction
    
    var body: some View {
        Button {
            let type = getTaskType(typeName: typeName, types: taskTypes, moc: managedObjectContext)
            if let task = task {
                let (result, message) = saveTask(task: task, type: type, taskInfo: taskInfo, moc: managedObjectContext)
                if result == .failure {
                    errorMessage = message
                    showErrorMessage.toggle()
                } else {
                    dismiss()
                }
            } else {
                let newTask = TaskObject(context: managedObjectContext)
                newTask.createdAt = taskInfo.createdAt
                let (result, message) = saveTask(task: newTask, type: type, taskInfo: taskInfo, moc: managedObjectContext)
                if result == .failure {
                    errorMessage = message
                    showErrorMessage.toggle()
                } else {
                    dismiss()
                }
            }
        } label: {
            Text("Save")
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor, lineWidth: 2)
                )
        }
        .foregroundColor(taskInfo.name.isEmpty ? .gray : .accentColor)
        .disabled(taskInfo.name.isEmpty || typeName.isEmpty)
        .padding(.bottom)
        .alert("Error", isPresented: $showErrorMessage) {
            Button("OK", role: .cancel) {
                dismiss()
            }
        } message: {
            Text(errorMessage)
        }
    }
}

struct SaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            SaveButtonView(typeName: .constant("New"), task: nil, taskInfo: Task(name: "Save Button", difficulty: "Easy"), action: .create)
        }
        .padding()
    }
}
