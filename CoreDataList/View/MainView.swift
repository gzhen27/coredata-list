//
//  Main.swift
//  CoreDataList
//
//  Created by G Zhen on 6/15/23.
//

import SwiftUI

struct MainView: View {
    @FetchRequest(sortDescriptors: []) private var tasks: FetchedResults<TaskEntity>
    @State private var showTaskCreatView = false
    
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showTaskCreatView = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                    }

                }
            }
        }
        .sheet(isPresented: $showTaskCreatView) {
            TaskCreationView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
