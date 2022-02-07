//
//  NewTextButton.swift
//  selfChat_569194
//
//  Created by Note on 07.02.22.
//

import SwiftUI

struct NewTextButton: View {
    
    var icon: Image
    
    var body: some View {
        HStack {
            icon
        }
    }
}

struct NewTextButton_Previews: PreviewProvider {
    static var previews: some View {
        NewTextButton(icon: Image(systemName: "pencil.circle"))
    }
}
