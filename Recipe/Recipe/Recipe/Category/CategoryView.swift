//
//  CategoryView.swift
//  Recipe
//
//  Created by Hang Le on 18.8.2022.
//

import SwiftUI

struct CategoryView: View {

    let columns = [GridItem(.adaptive(minimum: 170), spacing: 10)]

    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Category.allCases) { category in
                        NavigationLink {
                            CategorizedGrid(category: category)
                        } label: {
                            CategoryRow(category: category)
                        }
                    }
                } // LazyVGrid
                .padding(.horizontal, 10)
                .padding(.top, 15)
            } // ScrollView
//            List {
//                ForEach(Category.allCases) { category in
//                    NavigationLink {
//                        CategorizedGrid(category: category)
//                    } label: {
//                        CategoryRow(category: category)
//                    }
//                }
//            } // List
//            .listStyle(.inset)
            .navigationTitle("Ruokalajit")
        } // NavigationView
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ModelData())

    }
}
