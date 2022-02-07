//
//  TitleText.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct TitleText: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
            .padding(.all, 11.0)
            .frame(maxWidth: .infinity, alignment: SwiftUI.Alignment.leading)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(title: "Hello World")
    }
}
