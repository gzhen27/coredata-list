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
    
    @State private var name = ""
    @FocusState private var isTypingMode: Bool
    
    var nameInputView: some View {
        VStack {
            HStack {
                Image(systemName: "pencil.line")
                    .foregroundColor(.gray)
                    .font(.headline)
                TextField("task name", text: $name)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled(true)
                    .focused($isTypingMode)
                saveBtn
                    .foregroundColor(name.isEmpty ? .gray : .accentColor)
                    .disabled(name.isEmpty)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
        }
        .onTapGesture {
            isTypingMode = false
        }
    }
    
    var saveBtn: some View {
        Button {
            if !name.isEmpty {
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
                .padding(.top, 28)
            Spacer()
        }
        .padding(.horizontal)
        .presentationDetents([.fraction(0.10)])
        .presentationCornerRadius(8)
        .onAppear {
            isTypingMode = true
        }
    }
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView()
    }
}
