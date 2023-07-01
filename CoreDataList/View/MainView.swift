//
//  Main.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext)
    private var managedObjectContext
    
    @FetchRequest(fetchRequest: TaskObject.tasks)
    private var tasks
    
    @State
    private var showTaskCreateView = false
    
    @State
    private var searchText = ""
    
    @State
    private var filterdLiked = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(tasks) { task in
                    NavigationLink(destination: EditTaskView(task: task)) {
                        taskCell(task: task)
                    }
                }
                .onDelete(perform: deleteTask)
                .navigationTitle("Tasks")
                .navigationBarTitleDisplayMode(.inline)
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText)
            .onChange(of: searchText) { text in
                tasks.nsPredicate = text.isEmpty ? nil : NSPredicate(format: "name CONTAINS[cd] %@", text)
            }
            .toolbar {
                toolbarFilterItem
                toolbarPlusItem
            }
        }
        .fullScreenCover(isPresented: $showTaskCreateView) {
            TaskCreationView()
        }
    }
    
    var toolbarFilterItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                withAnimation(.easeOut(duration: 0.5)) {
                    filterdLiked.toggle()
                    tasks.nsPredicate = filterdLiked ? NSPredicate(format: "isLike == 1") : nil
                }
            } label: {
                Image(systemName: filterdLiked ? "heart.fill" : "heart")
                    .font(.title3)
            }
        }
    }
    
    var toolbarPlusItem: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                showTaskCreateView = true
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
            }
        }
    }
    
    private func taskCell(task: TaskObject) -> some View {
        HStack {
            Image(systemName: task.isLike ? "heart.fill" : "heart")
                .font(.largeTitle)
                .foregroundColor(task.isLike ? .accentColor : Color("BlackandWhite"))
                .animation(.easeInOut, value: task.isLike)
                .onTapGesture {
                    task.isLike.toggle()
                    try? managedObjectContext.save()
                }
            VStack(alignment: .leading) {
                Text(task.getName)
                    .font(.title2)
                Text("created at \(task.getCreatedAt)")
                    .font(.footnote)
            }
            Spacer()
            Text(task.getDifficulty)
        }
        .padding(.vertical, 8)
    }
    
    private func deleteTask(offsets: IndexSet) {
        for offset in offsets {
            managedObjectContext.delete(tasks[offset])
        }
        
        try? managedObjectContext.save()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.managedObjectContext, TasksContainer(devMode: true).persistentContainer.viewContext)
    }
}
