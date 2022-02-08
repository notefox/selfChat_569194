//
//  StartView.swift
//  selfChat_569194
//
//  Created by Note on 01.02.22.
//
//

import SwiftUI

struct StartView: View {

    @State var chats = AppInstance.instance.allChats()

    private var twoColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    private let navTitle: String = "Conversation"
    
    var body: some View {
        VStack {
            TitleText(title: navTitle)
            
            Conversations(chats: chats)
                .padding([.leading, .trailing])
                .shadow(radius: 5)
        }.navigationBarTitle(navTitle)
            .navigationBarHidden(true)
            .onAppear(perform: {
                updateChatList()
            })
    }

    private func updateChatList() {
        AppInstance.instance.initialize()
        chats = AppInstance.instance.allChats()
        chats = Set(Array(chats).sorted(by: chatSortingAlgorithm))
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
