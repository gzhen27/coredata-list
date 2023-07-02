//
//  DueDatePicker.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI

struct DueDatePicker: View {
    @Binding
    var dueOn: Date
    
    var body: some View {
        VStack {
            HStack {
                Text("Due Date:")
                    .font(.headline)
                Spacer()
                DatePicker("Due Date", selection: $dueOn)
                    .labelsHidden()
            }
        }
    }
}

struct DueDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DueDatePicker(dueOn: .constant(Date()))
    }
}
