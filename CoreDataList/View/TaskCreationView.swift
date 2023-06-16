//
//  TaskCreationView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/16/23.
//

import SwiftUI

struct TaskCreationView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var name: String = ""
    @State private var errorMessage = ""
    
    var nameInputView: some View {
        VStack {
            HStack {
                Image(systemName: "pencil.line")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("task name", text: $name)
                    .autocorrectionDisabled(true)
                saveBtn
                    .foregroundColor(name.isEmpty ? .gray : .accentColor)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
            Text(errorMessage)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .foregroundColor(.red)
        }
    }
    
    var saveBtn: some View {
        Button {
            if name.isEmpty {
                errorMessage = "The task name is missing."
            } else {
                let task = TaskEntity(context: managedObjectContext)
                task.name = name
                try? managedObjectContext.save()
                dismiss()
            }
        } label: {
            Text("Save")
        }
    }
    
    var body: some View {
        VStack {
            nameInputView
                .padding(.top)
            Spacer()
        }
        .padding(.horizontal)
        .presentationDetents([.fraction(0.10)])
        .presentationCornerRadius(8)
    }
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView()
    }
}
