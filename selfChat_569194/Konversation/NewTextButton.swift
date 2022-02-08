//
//  NewTextButton.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct NewTextButton: View {
    
    var icon: Image
    
    var user: User

    @Binding var creatingNewMessage: Bool

    var body: some View {
        NavigationLink(
            destination: TextInputView(user: user, creatingNewMessage: self.$creatingNewMessage),
            isActive: $creatingNewMessage) {
            VStack {
                icon
                    .frame(width: 50, height: 50)
                    .scaleEffect(2.0)
            }.frame(maxWidth: .infinity, alignment: .trailing)
                .border(Color.black, width: 2)
                
        }.isDetailLink(false)
    }
}
