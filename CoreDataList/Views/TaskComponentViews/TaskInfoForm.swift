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
    
    let type: ActionType
    
    var body: some View {
        VStack {
            NameTextFieldView(name: $name, type: type)
                .padding(.bottom, 28)
            DifficultyPickerView(difficulty: $difficulty)
        }
    }
}

struct TaskInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoForm(name: .constant("Task name"), difficulty: .constant("Easy"), type: .create)
    }
}
