//
//  cuisineView.swift
//  Piece
//
//  Created by Hang Le on 18.7.2022.
//

import SwiftUI

struct CuisineRow: View {
    let cuisine: Cuisine
    
    var body: some View {
        HStack {
            Text(cuisine.name)
//                .padding(4)
//                .cornerRadius(4)
        } //HStack
    }
}

struct CuisineView_Previews: PreviewProvider {
    static var previews: some View {
        CuisineRow(cuisine: .asian)
    }
}
