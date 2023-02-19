//
//  PieceApp.swift
//  Piece
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(recipes: Recipe.sampleData)
                .environmentObject(ModelData())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatifisable")
                }
        }
    }
}
