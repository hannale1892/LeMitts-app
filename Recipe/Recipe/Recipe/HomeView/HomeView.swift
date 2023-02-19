//
//  GridHome.swift
//  Recipe
//
//  Created by Hang Le on 1.8.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isPresentingNewRecipeView = false
    @State var currentTime = Date()
    
    var favoriteRecipes: [Recipe]  {
        return modelData.recipes.filter{ $0.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            List {
                HeaderRow()
                    .listRowInsets(EdgeInsets())
                HomeGridRow(presentedName: "Viimeiseksi lisätty", items: modelData.recipes)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                HomeGridRow(presentedName: "Suosikit", items: favoriteRecipes)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            } // List
            .navigationTitle("Päivän Resepti")
            .listStyle(.inset)
            .padding(.top, 10)
            .toolbar {
                Button(action: {
                    isPresentingNewRecipeView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewRecipeView) {
                NavigationView {
                    NewRecipe()
                        .navigationTitle("New Recipe")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingNewRecipeView = false
                                    modelData.reset()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    if modelData.selectedImage == nil {
                                        modelData.createRecipe(name: modelData.name,
                                                              serving: modelData.serving,
                                                              budget: modelData.budget,
                                                              calories: modelData.calories,
                                                              cookingTime: modelData.cookingTime,
                                                              cuisine: modelData.cuisine,
                                                              category: modelData.category,
                                                              ingredients: modelData.ingredients,
                                                              instructions: modelData.instructions,
                                                              isFavorite: false,
                                                              date: modelData.date,
                                                              image: modelData.image!)
                                        isPresentingNewRecipeView = false
                                    }
                                }
                                .disabled(modelData.buttonDisabled)
                            }
                        } //toolbar
                }
            }
        } // NavigationView
        
        .task {
            if FileManager().docExist(named: fileName) {
                modelData.loadRecipes()
            }
        } // Task
    }
}

struct GridHome_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}

