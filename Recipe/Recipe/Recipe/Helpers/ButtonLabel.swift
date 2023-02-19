//
//  ButtonLabel.swift
//  Piece
//
//  Created by Hang Le on 9.6.2022.
//

import SwiftUI

struct ButtonLabel: View {
    let symbolName: String
    let label: String
    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
            Text(label)
        }
        .font(.headline)
        .padding()
//        .frame(height: 40)
//        .background(Color.blue)
        .foregroundColor(.accentColor)
        .cornerRadius(10)
        
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel(symbolName: "camera", label: "Camera")
    }
}
