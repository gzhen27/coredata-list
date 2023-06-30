//
//  DifficultyPickerView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import SwiftUI

struct DifficultyPickerView: View {
    @Binding var difficulty: String
    
    var body: some View {
        Picker("Difficulty", selection: $difficulty) {
            ForEach(TaskObject.Difficulty.allCases, id: \.hashValue) { d in
                Text(d.localizedName).tag(d.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

struct DifficultyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyPickerView(difficulty: .constant(TaskObject.Difficulty.easy.rawValue))
    }
}
