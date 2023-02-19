//
//  PieceDetail.swift
//  recipe
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI

struct RecipeDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State var isPresentingEditView = false
    @State private var data = ModelData()
    
    static var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Helsinki")
        dateFormatter.locale = Locale(identifier: "fi_FI")

        return dateFormatter
    }
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            Image(uiImage: recipe.image)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea(edges: .top)
            VStack(alignment: .leading) {
                Text(RecipeDetail.dateFormat.string(from: recipe.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 1)
                HStack {
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        modelData.isFavoritePiece(recipe: recipe)
                    } label: {
                        if recipe.isFavorite {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 24))
                        } else {
                            Image(systemName: "heart")
                                .font(.system(size: 24))
                        }
                    }
                    .foregroundColor(.red)
                } //HStack
                .padding(.bottom, 6)
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("\(recipe.serving) annosta", systemImage: "person.fill")
                        Label("\(recipe.category.rawValue)", systemImage: "fork.knife")
                        Label("\(recipe.cookingTime) min", systemImage: "clock")
                    }
                    .font(.callout)
                    Spacer()
                    VStack(alignment: .trailing, spacing: 12)  {
                        Label("\(recipe.calories) kcal", systemImage: "flame")
                        Label("\(recipe.cuisine.rawValue)", systemImage: "flag")
                        Label("\(recipe.budget) €", systemImage: "bag")
                    }
                    .font(.callout)
                    .labelStyle(.trailingIcon)
                }

                Divider()
                Text("Ainekset")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                Text(recipe.ingredients)
                    .padding(.bottom, 8)
                
                Text("Ohjeet")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                Text(recipe.instructions)

            } // VStack
            .padding(.horizontal)
            .padding(.top, 4)
        } // ScrollView
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Muokkaa") {
                isPresentingEditView = true
                modelData.editPiece(from: recipe)
            }
        } // toolbar
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                NewRecipe()
                    .navigationTitle(recipe.name)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Peruuta") {
                                isPresentingEditView = false
                                modelData.reset()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Tallenna") {
                                isPresentingEditView = false
                                modelData.updatePiece(recipe: recipe)
                            }
                        }
                    }
            }
        } // sheet
    }
}

struct PieceDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeDetail(recipe: Recipe.sampleData[1])
                .environmentObject(ModelData())
        }
    }
}
