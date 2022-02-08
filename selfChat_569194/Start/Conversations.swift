//
//  ConversationOverview.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct Conversations: View {

    var chats: [Chat]
    
    init(chats: Set<Chat>) {
        self.chats = Array(chats)
    }
    
    private var twoColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(chats) { chat in
                    ChatIcon(
                        user: chat.withUser,
                        representative_characters: chat.withUser.initials,
                        color: getColorByHex(chat.withUser.rgbHexValue)
                    )
                }
            }.padding()
        }.background(Color(red: 0.988, green: 0.931, blue: 0.858))
    }
}

struct Conversations_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Conversations(chats: Set(Chat.emptySamples))
    }
}
