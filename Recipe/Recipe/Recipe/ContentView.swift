//
//  ContentView.swift
//  Recipe
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI

struct ContentView: View {
    
    let recipes: [Recipe]
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Sinulle", systemImage: "house")
                }

            CategoryView()
                .tabItem {
                    Label("Ruokalajit", systemImage: "list.bullet")
                }

            RecipeList()
                .tabItem {
                    Label("Haku", systemImage: "magnifyingglass")
                }

        }
//        .navigationViewStyle(StackNavigationViewStyle())
        .modifier(MyNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: Recipe.sampleData)
            .environmentObject(ModelData())
    }
}


struct MyNavigationViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        if UIDevice.current.model == "iPad" {
            content.navigationViewStyle(StackNavigationViewStyle())
        } else {
            content.navigationViewStyle(DefaultNavigationViewStyle())
        }
    }
}
