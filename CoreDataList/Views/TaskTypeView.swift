//
//  TaskTypeView.swift
//  CoreDataList
//
//  Created by G Zhen on 7/15/23.
//

import SwiftUI

struct TaskTypeView: View {
    @FetchRequest<TaskType>(sortDescriptors: [])
    private var taskTypes
    
    var body: some View {
        VStack {
            NavigationStack {
                List(taskTypes) { type in
                    NavigationLink {
                        List(type.getTasks) { task in
                            Text(task.name ?? "No Name")
                        }
                    } label: {
                        Text(type.name ?? "No Name")
                    }

                }
                .navigationTitle("Types")
            }
        }
    }
}

struct TaskTypeView_Previews: PreviewProvider {
    static var previews: some View {
        TaskTypeView()
    }
}
