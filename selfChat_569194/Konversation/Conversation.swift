//
//  ConversationOverview.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct Conversation: View {
    
    var user: User

    @State var messages: Array<Message> = []
    
    @State var creatingNewMessage: Bool = false
    
    var body: some View {
        VStack() {
            MessageListing(messages: messages).onAppear(perform: {
                updateMessageList()
            })
            
            NewTextButton(icon: Image("pencil.circle"), user: user, creatingNewMessage: $creatingNewMessage)
        }.navigationBarTitleDisplayMode(.inline)
    }

    private func updateMessageList() {
        messages = Array(try! AppInstance.instance.getChatWithUser(user).allMessages())
    }
}
