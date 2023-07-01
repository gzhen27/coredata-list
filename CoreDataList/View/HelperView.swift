//
//  HelperView.swift
//  CoreDataList
//
//  Created by G Zhen on 6/30/23.
//

import SwiftUI

func closeBtn(dismiss: DismissAction) -> some View {
    return HStack {
        Spacer()
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.title3)
        }
    }
}

func customHeaderSection(text content: String) -> some View {
    HStack {
        Text(content)
            .font(.largeTitle)
            .bold()
        Spacer()
    }
    .padding(.bottom, 36)
}
