//
//  FilteredList.swift
//  Piece
//
//  Created by Hang Le on 6.9.2022.
//

import SwiftUI

struct FilteredList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
//                Menu {
//                    Button(action: { sortRecipes(sort: SortOption.name, recipes: &modelData.recipes ) })
//                    {
//                        Label("Name", systemImage: "abc")
//                    }
//                    Button(action: { sortRecipes(sort: SortOption.latest, recipes: &modelData.recipes) })
//                    {
//                        Label("Lastest", systemImage: "clock")
//                    }
//                    Button(action: { sortRecipes(sort: SortOption.fastest, recipes: &modelData.recipes) })
//                    {
//                        Label("Fastest", systemImage: "hourglass")
//                    }
//                } label: {
//                    Label("Sorted", systemImage: "slider.horizontal.3")
//                }
                
                ForEach(modelData.recipes) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
            } // List
            .listStyle(.inset)
            .navigationTitle("Filtered")
            .animation(.default, value: modelData.recipes)

        }
    }
//    private func sortRecipes(sort: SortOption, recipes: inout [Recipe]) {
//        switch sort {
//        case .fastest:
//            recipes.sort(by: { $0.cookingTime < $1.cookingTime })
//        case .latest:
//            recipes.sort(by: { $0.date > $1.date })
//        case .name:
//            recipes.sort(by: { $0.name < $1.name })
//        }
//    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList()
            .environmentObject(ModelData())
    }
}
