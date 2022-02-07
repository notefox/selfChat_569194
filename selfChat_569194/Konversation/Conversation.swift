//
//  ConversationOverview.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct Conversation: View {
    
    var chat: Chat
    
    var body: some View {
        VStack {
            ReturnButton(title: "Text", viewToReturnTo: StartView())
            MessageListing(messages: Array(chat.allMessages()))
            NewTextButton(icon: Image(systemName: "pencil.circle"))
        }
    }
}

struct Conversation_Previews: PreviewProvider {
    static var previews: some View {
        Conversation(chat: Chat.fullSample())
    }
}
