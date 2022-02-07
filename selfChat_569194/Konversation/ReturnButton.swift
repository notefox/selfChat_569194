//
//  ReturnButton.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct ReturnButton: View {
    
    var title: String = "Back"
    var viewToReturnTo = StartView()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReturnButton_Previews: PreviewProvider {
    static var previews: some View {
        ReturnButton(title: "yay", viewToReturnTo: StartView())
    }
}
