//
//  StartView.swift
//  selfChat_569194
//
//  Created by Note on 01.02.22.
//
//

import SwiftUI

struct StartView: View {

    var instance = AppInstance.instance

    private var twoColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    private let navTitle: String = "Conversation"
    
    var body: some View {
        VStack {
            TitleText(title: navTitle)
            
            Conversations(chats: instance.allChats())
                .padding([.leading, .trailing])
                .shadow(radius: 5)
        }.navigationBarTitle(navTitle)
            .navigationBarHidden(true)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
