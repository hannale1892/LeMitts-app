//
//  cuisinePicker.swift
//  Piece
//
//  Created by Hang Le on 18.7.2022.
//

import SwiftUI

struct CuisinePicker: View {
    @Binding var selection: Cuisine
    
    var body: some View {
        Picker("Keittiö", selection: $selection) {
            ForEach(Cuisine.allCases) { cuisine in
                Text(cuisine.name)
                    .tag(cuisine)
            }
        }
    }
}

struct CuisinePicker_Previews: PreviewProvider {
    static var previews: some View {
        CuisinePicker(selection: .constant(.asian))
    }
}
