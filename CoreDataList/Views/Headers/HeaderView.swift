//
//  HeaderView.swift
//  CoreDataList
//
//  Created by G Zhen on 7/1/23.
//

import SwiftUI

struct HeaderView: View {
    let content: String
    
    var body: some View {
        VStack {
            CloseButtonView()
            HStack {
                Text(content)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
        }
        .padding(.bottom)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(content: "Task header")
    }
}
