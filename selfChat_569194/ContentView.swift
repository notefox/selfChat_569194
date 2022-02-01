//
//  StartView.swift
//  selfChat_569194
//
//  Created by Note on 01.02.22.
//
//

import SwiftUI

struct ContentView: View {
    
    //@State var chats: Set<Chat> = Set()
    
        
    private var chats: [Chat] = [Chat(User(name: "test"))]
     
    private var colors: [Color] = [.yellow, .purple, .green]
     
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        VStack {
            Text("Conversation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: SwiftUI.Alignment.leading)
                
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 36) {
                    ForEach((0...chats.count-1), id: \.self) {
                        Text(chats[$0].withUser.initials)
                            .font(.system(size: 30))
                            .frame(width: 50.0, height: 50.0)
                            .background(colors[$0 % colors.count])
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
