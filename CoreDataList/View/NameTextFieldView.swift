//
//  NameTextFieldView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import SwiftUI

struct NameTextFieldView: View {
    @Binding
    var name: String
    
    let type: ActionType
    
    var body: some View {
        VStack {
            HStack {
                Text("Name the task:")
                    .font(.headline)
                Spacer()
            }
            HStack {
                Image(systemName: "pencil.line")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("task name", text: $name)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
        }
    }
}

enum ActionType {
    case create
    case edit
}

struct NameTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        NameTextFieldView(name: .constant("Task"), type: .create)
    }
}
