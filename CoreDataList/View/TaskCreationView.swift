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
    
    @FocusState
    private var isTypingMode: Bool
    
    var body: some View {
        VStack {
            closeBtn(dismiss: dismiss)
            customHeaderSection(text: "Create Task")
            nameInputView
                .padding(.bottom, 28)
            DifficultyPickerView(difficulty: $difficulty)
            Spacer()
        }
        .padding(.horizontal)
        .presentationCornerRadius(8)
        .onAppear {
            isTypingMode = true
        }
    }
    
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
}

struct TaskCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCreationView()
    }
}
