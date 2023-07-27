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
                    if (type.getTasks.count > 0) {
                        Section {
                            ForEach(type.getTasks) { task in
                                Text(task.getName)
                            }
                        } header: {
                            Text("\(type.getName) (\(type.getTasks.count))")
                        }
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
