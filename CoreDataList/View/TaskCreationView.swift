//
//  TaskCreationView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/16/23.
//

import SwiftUI

struct TaskCreationView: View {
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.managedObjectContext)
    private var managedObjectContext
    
    @State
    private var name = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    var body: some View {
        VStack {
            closeBtn(dismiss: dismiss)
            customHeaderSection(text: "Create Task")
            NameTextFieldView(name: $name, type: .create)
                .padding(.bottom, 28)
            DifficultyPickerView(difficulty: $difficulty)
            Spacer()
            saveTaskbtn(task: nil, taskInfo: Task(name: name, difficulty: difficulty), moc: managedObjectContext, dismiss: dismiss)
                .foregroundColor(name.isEmpty ? .gray : .accentColor)
                .disabled(name.isEmpty)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .presentationCornerRadius(8)
    }
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView()
    }
}
