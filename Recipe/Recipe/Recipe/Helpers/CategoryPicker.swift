//
//  CategoryPicker.swift
//  Piece
//
//  Created by Hang Le on 21.7.2022.
//

import SwiftUI

struct CategoryPicker: View {
    @Binding var selection: Category
    
    var body: some View {
        Picker("Category", selection: $selection) {
            ForEach(Category.allCases) { category in
                Text(category.name)
                    .tag(category)
            }
        } // Picker
        
    }
}

struct CategoryPicker_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, world")
    }
}

