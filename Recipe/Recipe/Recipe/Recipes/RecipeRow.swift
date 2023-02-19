//
//  PieceRow.swift
//  recipe
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe

    var body: some View {
        HStack {
            Image(uiImage: recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .clipShape(RoundedRectangle(cornerRadius: 4))

            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.name)

                Text("\(recipe.category.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("\(recipe.cookingTime) minutes")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            if recipe.isFavorite {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
            }
            
        }
    }
}

struct PieceRow_Previews: PreviewProvider {

    static var previews: some View {
        RecipeRow(recipe: Recipe.sampleData[0])
    }
}

