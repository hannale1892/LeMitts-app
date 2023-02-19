//
//  FavoriteRecipes.swift
//  Recipe
//
//  Created by Hang Le on 24.8.2022.
//

import SwiftUI

struct HomeGridRowSeeAll: View {
    @EnvironmentObject var modelData: ModelData
    var presentedName: String

    var items: [Recipe]

    var favoriteRecipes: [Recipe]  {
        return modelData.recipes.filter{$0.isFavorite}
    }
    
    var body: some View {
            List {
                ForEach(items) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
            } // List
            .listStyle(.inset)
            .navigationTitle(presentedName)
    }
}

struct FavoriteRecipes_Previews: PreviewProvider {
    static var previews: some View {
        HomeGridRowSeeAll(presentedName: "Recently Added", items: Array(Recipe.sampleData))
            .environmentObject(ModelData())
    }
}
