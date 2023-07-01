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
    
    let type: ActionType
    
    var body: some View {
        VStack {
            NameTextFieldView(name: $name, type: type)
                .padding(.bottom)
            DifficultyPickerView(difficulty: $difficulty)
                .padding(.bottom)
            VStack {
                HStack {
                    Text("Due Date:")
                        .font(.headline)
                    Spacer()
                    DatePicker("Due Date", selection: $dueOn)
                        .labelsHidden()
                }
            }
        }
    }
}

struct TaskInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoForm(name: .constant("Task name"), difficulty: .constant("Easy"), dueOn: .constant(Date()), type: .create)
    }
}
