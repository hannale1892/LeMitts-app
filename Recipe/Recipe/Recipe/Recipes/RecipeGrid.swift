//
//  RecipeGrid.swift
//  Piece
//
//  Created by Hang Le on 25.8.2022.
//

import SwiftUI

struct RecipeGrid: View {
    @EnvironmentObject var modelData: ModelData
    var recipe: Recipe
    let guides = [ GridItem(.flexible(minimum: 75),  alignment: .top),
                   GridItem(.flexible(minimum: 75),  alignment: .top)
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: guides, spacing: 215) {
                ForEach(modelData.recipes) { recipe in
                    GeometryReader { geometry in
                        VStack(alignment: .leading) {
                            Image(uiImage: recipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.width)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Text(recipe.name)
                                .foregroundColor(.primary)
                                .font(.system(size: 14, weight: .regular))
                        }
                    } // VStack
                } // ForEach
            } //LazyVGrid
        }
        .padding(.horizontal, 8)
    }
}

struct RecipeGrid_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGrid(recipe: Recipe.sampleData[1])
            .environmentObject(ModelData())
    }
}
