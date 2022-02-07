//
//  ChatIcon.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct ChatIcon: View {
    
    var representative_characters: String
    var color: Color
    
    var outerCircleSize = 20.0
    var innerCircleSize = 70.0
    
    var outerCircleColor = Color.white
    
    var shadowRadius = 0.1
    
    var body: some View {
        ZStack {
            Circle()
                .fill(outerCircleColor)
                .frame(width: innerCircleSize + outerCircleSize, height: innerCircleSize + outerCircleSize)
                .shadow(radius: shadowRadius)
            
            Circle()
                .fill(color)
                .frame(width: innerCircleSize, height: innerCircleSize)
            
            Text(representative_characters)
                .foregroundColor(.white)
            
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ChatIcon(representative_characters: "SA", color: .red)
    }
}
