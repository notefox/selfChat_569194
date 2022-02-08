//
//  NewMessageField.swift
//  selfChat_569194
//
//  Created by Markus Zierhofer on 08.02.22.
//

import SwiftUI

struct NewMessageField: View {
    
    var user: User
    
    @Binding var external: Bool

    @Binding var creatingNewMessage: Bool

    @State var messageText: String = ""

    var body: some View {
        HStack {
            ZStack {
                TextField("Message", text: $messageText)
            }.padding()

            Button(action: {
                addNewMessageToChatWithUser(user: user, message: messageText, external: external)
                creatingNewMessage.toggle()
            }, label: {
                Image(systemName: "location.circle.fill")
                        .scaleEffect(2.0)
            }).frame(width: 50, height: 50, alignment: .leading)
        }
    }

    private func addNewMessageToChatWithUser(user: User, message: String, external: Bool) {
        let local: Bool = !external

        var chat: Chat = try! AppInstance.instance.getChatWithUser(user)

        chat.addMessage(message: message, local: local)
        
        print(chat.allMessages())

        try! AppInstance.instance.updateChat(chat)
    }
}

struct NewMessageField_Previews: PreviewProvider {
    static var previews: some View {
        Text("okay")
    }
}
