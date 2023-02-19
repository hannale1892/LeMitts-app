//
//  CategoryRow.swift
//  Recipe
//
//  Created by Hang Le on 19.8.2022.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var modelData: ModelData
    var category: Category
    var recipeList: [Recipe]  {
        return modelData.recipes.filter{$0.category.rawValue.contains("\(category.name)") }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(category.name)
                .font(.title2)
                .foregroundColor(.white)
            if recipeList.count == 1 || recipeList.count == 0 {
                Text("\(recipeList.count) resepti")
                    .font(.callout)
                    .foregroundColor(.secondary)
            } else {
                Text("\(recipeList.count) reseptiä")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
                
        } // VStack
        .frame(minWidth: 170, maxWidth: .infinity, minHeight: 170)
        .background(.teal)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryRow(category: .breakfast)
                .environmentObject(ModelData())
        }
    }
}
