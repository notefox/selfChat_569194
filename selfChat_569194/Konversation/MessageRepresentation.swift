//
//  messageRepresentation.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct MessageRepresentation: View {
    
    var message: Message
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(getRepresentativeMessageColorOfMessage(message))
                
                Text(message.message).padding(.all, 5.0)
            }.frame(maxWidth: UIScreen.main.bounds.width / 2.0 + 20)
        }.frame(maxWidth: .infinity, alignment: getRepresentativeMessageAlignment(message))
            .padding([.top, .leading, .trailing])
    }
}

struct MessageRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        MessageRepresentation(message: Message("this is an awesome message"))
    }
}
