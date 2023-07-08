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
    
    @State
    private var errorMessage = ""
    
    @State
    private var showErrorMessage = false
    
    let task: FetchedResults<TaskObject>.Element?
    let taskInfo: Task
    let action: SaveAction
    
    var body: some View {
        Button {
            if let task = task {
                let (result, message) = saveTask(task: task, taskInfo: taskInfo, moc: managedObjectContext)
                if result == .failure {
                    errorMessage = message
                    showErrorMessage.toggle()
                }
            } else {
                let newTask = TaskObject(context: managedObjectContext)
                newTask.createdAt = taskInfo.createdAt
                let (result, message) = saveTask(task: newTask, taskInfo: taskInfo, moc: managedObjectContext)
                if result == .failure {
                    errorMessage = message
                    showErrorMessage.toggle()
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
        .disabled(taskInfo.name.isEmpty)
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
        SaveButtonView(task: nil, taskInfo: Task(name: "Save Button", difficulty: "Easy"), action: .create)
    }
}
