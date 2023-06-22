//
//  Main.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import SwiftUI

struct MainView: View {
    @FetchRequest<TaskObject>(sortDescriptors: [SortDescriptor(\.createdAt)]) private var tasks
    @State private var showTaskCreateView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.getName)
                            .font(.title2)
                        Text("created at \(task.getCreatedAt)")
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarItems
            }
        }
        .sheet(isPresented: $showTaskCreateView) {
            TaskCreationView()
        }
    }
    
    var toolbarItems: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                showTaskCreateView = true
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
            }

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environment(\.managedObjectContext, TasksContainer(devMode: true).persistentContainer.viewContext)
    }
}
