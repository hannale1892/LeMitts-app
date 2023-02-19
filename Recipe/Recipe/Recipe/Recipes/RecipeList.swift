//
//  RecipeList.swift
//  recipe
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchTerm: String = ""
    @State var selection: SortOption = SortOption.latest
    
    var recipeList: [Recipe] {
        if searchTerm.isEmpty {
            return modelData.recipes
        } else {
            return modelData.searchResults
        }
    }
    
    var body: some View {
        NavigationView {
//            if modelData.recipes.isEmpty {
//                HStack {
//                    Spacer()
//                    Text("You don't have any recipe yet")
//                        .font(.callout)
//                        .foregroundColor(.secondary)
//                        .padding()
//                    Spacer()
//                }
//            } else {
                List {
                    Menu {
                        Button(action: { sortRecipes(sort: SortOption.name, recipes: &modelData.recipes) }) {
                            Label("Akkosjärjestys", systemImage: "abc")
                        }
                        Button(action: { sortRecipes(sort: SortOption.latest, recipes: &modelData.recipes) }) {
                            Label("Uusin", systemImage: "clock")
                        }
                        Button(action: { sortRecipes(sort: SortOption.fastest, recipes: &modelData.recipes) }) {
                            Label("Nopein", systemImage: "hourglass")
                        }
                    } label: {
                        Label("Lajittele", systemImage: "slider.horizontal.3")
                    }
                    
                    ForEach(recipeList) { recipe in
                        NavigationLink {
                            RecipeDetail(recipe: recipe)
                        } label: {
                            RecipeRow(recipe: recipe)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive, action: {
                                modelData.removePiece(recipe: recipe)
                            }, label: {
                                Label("Poista", systemImage: "trash")
                            })
                        } // Swipe Action
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                modelData.isFavoritePiece(recipe: recipe)
                            } label: {
                                if recipe.isFavorite {
                                    Label("Unfavorite", systemImage: "heart.slash")
                                } else {
                                    Label("Favorite", systemImage: "heart")
                                }
                            }
                            .tint(.accentColor)
                        } // Swipe Action
                    }
                } // List
                .task {
                    if FileManager().docExist(named: fileName) {
                        modelData.loadRecipes()
                    }
                    
                } // Task
                .listStyle(.inset)
                .navigationTitle("Kaikki Reseptit")
                .animation(.default, value: searchTerm)
                .animation(.default, value: modelData.recipes)
//            }

        } // Navigation View
        .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Hae reseptiä"))
        .onChange(of: searchTerm) { searchTerm in
            modelData.searchResults = modelData.recipes.filter({ recipe in
                recipe.name.lowercased().contains(searchTerm.lowercased()) ||
                recipe.ingredients.lowercased().contains(searchTerm.lowercased()) ||
                recipe.category.rawValue.lowercased().contains(searchTerm.lowercased()) ||
                recipe.cuisine.rawValue.lowercased().contains(searchTerm.lowercased())
            })
        } // onChange
        
    }
    
    private func sortRecipes(sort: SortOption, recipes: inout [Recipe]) {
        switch sort {
        case .fastest:
            recipes.sort(by: { $0.cookingTime < $1.cookingTime })
        case .latest:
            recipes.sort(by: { $0.date > $1.date })
        case .name:
            recipes.sort(by: { $0.name < $1.name })
        }
    }
}
struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList()
            .environmentObject(ModelData())
    }
}
