//
//  Main.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import SwiftUI

struct MainView: View {
    @FetchRequest(sortDescriptors: []) private var tasks: FetchedResults<TaskEntity>
    @State private var showTaskCreateView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(tasks) { task in
                    Text(task.name ?? "")
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
