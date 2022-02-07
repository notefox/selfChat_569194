//
//  MessageListing.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct MessageListing: View {
    
    var messages: [Message]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(messages) { message in
                    MessageRepresentation(message: message)
                }
            }
        }
    }
}

struct MessageListing_Previews: PreviewProvider {
    static var previews: some View {
        MessageListing(messages: [Message("cool"), Message(user: User(name: "me"), message: "this is really just alot of text so lets see how well this will work fuck yeabh!!!!!!!!!")])
    }
}
