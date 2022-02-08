//
//  TextInputView.swift
//  selfChat_569194
//
//  Created by Markus Zierhofer on 08.02.22.
//

import SwiftUI

struct TextInputView: View {
    
    var user: User
    
    @State var external: Bool = false
    
    @Binding var creatingNewMessage: Bool
    
    var body: some View {
        LazyVStack {
            VStack {
                NewMessageField(user: user,
                                external: $external,
                                creatingNewMessage: self.$creatingNewMessage)
                
                SenderSettings(external: $external)
            }
        }.frame(maxHeight: .infinity, alignment: .top)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        Text("no preview")
    }
}
