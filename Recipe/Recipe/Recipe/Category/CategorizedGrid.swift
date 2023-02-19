//
//  CategoriedRecipeList.swift
//  Piece
//
//  Created by Hang Le on 19.8.2022.
//

import SwiftUI

struct CategorizedGrid: View {
    @EnvironmentObject var modelData: ModelData
    var category: Category
    var recipeList: [Recipe]  {
        return modelData.recipes.filter{$0.category.rawValue.contains("\(category.name)") }
    }
    
    let guides = [GridItem(.adaptive(minimum: 175), spacing: 0)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: guides, spacing: 14) {
                ForEach(recipeList) { recipe in
                        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
                            CategoryItem(recipe: recipe)
                        }
                } // ForEach
            } //LazyVGrid
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        
   // For List Row Reference
///        List(recipeList) { recipe in
///            NavigationLink {
///                RecipeDetail(recipe: recipe)
///            } label: {
///                RecipeRow(recipe: recipe)
///            }
///        } // List
///        .listStyle(.inset)
///        .navigationTitle(category.name)
    }
}

struct CategoriedRecipeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        CategorizedGrid(category: .breakfast)
            .environmentObject(ModelData())
        }
    }
}
