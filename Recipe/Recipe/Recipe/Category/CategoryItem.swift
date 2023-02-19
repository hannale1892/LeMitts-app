//
//  CategoryItem.swift
//  LeMitts
//
//  Created by Hang Le on 27.10.2022.
//

import SwiftUI

struct CategoryItem: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 180)
                .cornerRadius(5)
            Text(recipe.name)
                .foregroundColor(.primary)
                .lineLimit(1)
                .font(.system(size: 16, weight: .regular))
                .frame(width: 170, alignment: .leading)
            
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(recipe: Recipe.sampleData[2])
    }
}
