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
    private var difficulty = "easy"
    
    @FocusState
    private var isTypingMode: Bool
    
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
                Picker("Difficulty", selection: $difficulty) {
                    Text("Easy").tag("easy")
                    Text("Medium").tag("medium")
                    Text("Hard").tag("hard")
                }
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
                let task = TaskObject(context: managedObjectContext)
                task.name = name
                task.isLike = false
                task.createdAt = Date.now
                task.difficulty = difficulty
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
