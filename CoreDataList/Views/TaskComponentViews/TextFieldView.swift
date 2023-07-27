//
//  TextFieldView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding
    var name: String
    
    let type: SaveAction
    let title: String
    let placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
            }
            HStack {
                Image(systemName: "pencil.line")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField(placeholder, text: $name)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
        }
    }
}

struct NameTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextFieldView(name: .constant("Task"), type: .create, title: "Name", placeholder: "placeholder")
        }
        .padding()
    }
}
