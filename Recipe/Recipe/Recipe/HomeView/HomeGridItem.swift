//
//  GridItem.swift
//  Piece
//
//  Created by Hang Le on 1.8.2022.
//

import SwiftUI

struct HomeGridItem: View {
    var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
//                .clipShape(RoundedRectangle(cornerRadius: 5))
            Text(recipe.name)
                .frame(width: 155, alignment: .leading)
                .foregroundColor(.primary)
                .font(.caption)
//                .truncationMode(.tail)
        } // VStack
        .padding(.leading, 12)
    }
}

struct GridItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridItem(recipe: Recipe.sampleData[1])
        
    }
}
