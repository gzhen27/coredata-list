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
    
    let task: FetchedResults<TaskObject>.Element?
    let taskInfo: Task
    
    var body: some View {
        Button {
            saveTask(task: task, taskInfo: taskInfo, moc: managedObjectContext)
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
        .foregroundColor(taskInfo.name.isEmpty ? .gray : .accentColor)
        .disabled(taskInfo.name.isEmpty)
        .padding(.bottom)
    }
}

struct SaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonView(task: nil, taskInfo: Task(name: "Save Button", difficulty: "Easy"))
    }
}
