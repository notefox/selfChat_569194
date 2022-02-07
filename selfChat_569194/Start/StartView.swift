//
//  StartView.swift
//  selfChat_569194
//
//  Created by Note on 01.02.22.
//
//

import SwiftUI

struct StartView: View {

    @StateObject fileprivate var instance = AppInstance()

    private var twoColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            TitleText(title: "Conversation")
       
            Conversations(chats: instance.allChats())
                .padding([.leading, .trailing])
                .shadow(radius: 5)
            
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
