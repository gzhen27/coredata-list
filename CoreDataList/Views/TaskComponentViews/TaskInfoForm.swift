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
    let createdAt: String?
    let modifiedAt: String?
    
    var body: some View {
        VStack {
            NameTextFieldView(name: $name, type: type)
                .padding(.bottom)
            DifficultyPickerView(difficulty: $difficulty)
                .padding(.bottom)
            DueDatePicker(dueOn: $dueOn)
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
    }
}

struct TaskInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoForm(name: .constant("Task name"), difficulty: .constant("Easy"), dueOn: .constant(Date()), type: .create, createdAt: nil, modifiedAt: nil)
    }
}
