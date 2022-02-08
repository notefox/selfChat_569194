//
//  SenderSettings.swift
//  selfChat_569194
//
//  Created by Markus Zierhofer on 08.02.22.
//

import SwiftUI

struct SenderSettings: View {
    
    var external: Binding<Bool>
    
    var body: some View {
        Toggle(isOn: external) {
            
        }
    }
}

struct SenderSettings_Previews: PreviewProvider {
    static var previews: some View {
        Text("no preview")
    }
}
