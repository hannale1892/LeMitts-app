//
//  GridRow.swift
//  Recipe
//
//  Created by Hang Le on 1.8.2022.
//

import SwiftUI

struct HomeGridRow: View {
    var presentedName: String
    var items: [Recipe]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(presentedName)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                if items.isEmpty {
                    // "See all" doesn't show
                } else {
                    NavigationLink(destination: HomeGridRowSeeAll(presentedName: presentedName, items: items)) {
                        Spacer()
                        Text("Näytä kaikki")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
            } // HStack
            .padding(.top, 15)
            .padding(.trailing, 15)
            .padding(.leading, 15)

            if items.isEmpty {
                HStack {
                    Spacer()
                    Text("Sinulla ei ole reseptiä.")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(items.prefix(10)) { recipe in
                            NavigationLink {
                                RecipeDetail(recipe: recipe)
                            } label: {
                                HomeGridItem(recipe: recipe)
                            }
                        }
                    }
                } // ScrollView
                .frame(height: 185)
            }
        } // VStack
        .padding(.top, 10)
    }
}

struct GridRow_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeGridRow(presentedName: "Viimeiseksi lisätty", items: Array(Recipe.sampleData))
    }
}
