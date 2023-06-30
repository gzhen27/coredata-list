//
//  EditTaskView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/29/23.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var task: FetchedResults<TaskObject>.Element
    
    @State
    private var taskName = ""
    
    @State
    private var difficulty = TaskObject.Difficulty.easy.rawValue
    
    @State
    private var editingTaskName = false
    
    @FocusState
    private var isEditngNameFocus: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                }
            }
            .padding(.bottom, 50)
            HStack {
                if editingTaskName {
                    nameEditingField
                } else {
                    Text("Task: ")
                    Text(taskName)
                        .bold()
                }
                Spacer()
                Button {
                    editingTaskName.toggle()
                    isEditngNameFocus.toggle()
                } label: {
                    Text(editingTaskName ? "Done" : "Edit")
                }
            }
            .animation(.easeInOut, value: editingTaskName)
            .padding(.bottom, 30)
            HStack {
                Text("Difficulty: ")
                    .padding(.trailing, 8)
                DifficultyPickerView(difficulty: $difficulty)
                Spacer()
            }
            Spacer()
            Button {
                task.difficulty = difficulty
                task.name = taskName
                try? managedObjectContext.save()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 2)
                    )
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            difficulty = task.getDifficulty
            taskName = task.getName
        }
    }
    
    var nameEditingField: some View {
        HStack {
            Image(systemName: "pencil.line")
                .foregroundColor(.gray)
                .font(.headline)
            TextField("task name", text: $taskName)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .focused($isEditngNameFocus)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: createPreviewTask())
    }
    
    static func createPreviewTask() -> FetchedResults<TaskObject>.Element {
        let context = TasksContainer().persistentContainer.viewContext
        let task = TaskObject(context: context)
        task.name = "Preview task"
        task.createdAt = Date.now
        task.difficulty = "easy"
        task.isLike = true
        
        return task
    }
}