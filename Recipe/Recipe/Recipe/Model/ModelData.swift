//
//  ViewModel.swift
//  recipe
//
//  Created by Hang Le on 7.6.2022.
//

import SwiftUI
import Combine

class ModelData: ObservableObject {
    @Published var recipes: [Recipe] = []

    @Published var image: UIImage?
    @Published var selectedImage: Recipe?
    @Published var source: PickerSource.Source = .library
    
    @Published var name: String = ""
    @Published var serving: Int = 4
    @Published var budget: Int = 0
    @Published var calories: Int = 0
    @Published var cookingTime: Int = 0
    
    @Published var cuisine: Cuisine = .universal
    @Published var category: Category = .unknown
    
    @Published var ingredients: String = ""
    @Published var instructions: String = ""
    @Published var date: Date = Date()
    
    @Published var searchResults: [Recipe] = []
    @Published var isEditting = false
    @Published var showFileAlert = false
    @Published var appError: RecipeError.ErrorType?

    init() {
        print(FileManager.docDirURL.path)
    }
    
    var buttonDisabled: Bool {
        name.isEmpty || ingredients.isEmpty || image == nil
    }
    
    let starterRecipe = [
        Recipe(name: "Strawberry Smoothie", serving: 2, budget: 15, calories: 245, cookingTime: 30, cuisine: .european, category: .dessert,
               ingredients: "2 cups frozen strawberries\n1 banana (room temperature)\n¼ cup Greek yogurt*\n1 cup milk (or almond milk or oat milk)\n1 ½ tablespoons maple syrup, honey, or agave syrup\n½ cup ice\nOptional add-ins: 1 tablespoon almond butter, ¼ teaspoon vanilla, fresh mint leaves or basil leaves",
               instructions: "Place all ingredients in a blender, breaking the banana into pieces. Blend until creamy and frothy, stopping and scraping down the sides as necessary. If desired, garnish with a frozen strawberry and mint sprig. Serve immediately or store in a covered jar in the refrigerator for 2 days.",
               isFavorite: false, date: Date(), imageName: "Chia-Seed-Smoothie-4")]
    
    func reset() {
        image = nil
        name = ""
        serving = 0
        budget = 0
        calories = 0
        cookingTime = 0
        cuisine = Cuisine.universal
        category = Category.unknown
        ingredients = ""
        instructions = ""
        selectedImage = nil
    }
    
    func createRecipe(name: String, serving: Int, budget: Int, calories: Int, cookingTime: Int, cuisine: Cuisine, category: Category, ingredients: String, instructions: String, isFavorite: Bool, date: Date, image: UIImage) {
        let recipe = Recipe(name: name, serving: serving, budget: budget, calories: calories, cookingTime: cookingTime, cuisine: cuisine, category: category, ingredients: ingredients, instructions: instructions, isFavorite: isFavorite, date: date, imageName: "")
        do {
            try FileManager().saveImage(id: "\(recipe.id)", image: image)
            recipes.insert(recipe, at: 0)
            saveRecipes()
        } catch {
            showFileAlert = true
            appError = RecipeError.ErrorType(error: error as! RecipeError)
        }
    }

    
    func editPiece(from recipe: Recipe) {
        image = recipe.image
        name = recipe.name
        serving = recipe.serving
        budget = recipe.budget
        calories = recipe.calories
        cookingTime = recipe.cookingTime
        cuisine = recipe.cuisine
        category = recipe.category
        ingredients = recipe.ingredients
        instructions = recipe.instructions
    }
    
    func updatePiece(recipe: Recipe) {
        guard let pieceIndex = recipes.firstIndex(where: { storedPiece in
            recipe.id == storedPiece.id})
        else { print("No recipe to update")
            return }
        recipes[pieceIndex].name = name
        recipes[pieceIndex].ingredients = ingredients
        recipes[pieceIndex].serving = serving
        recipes[pieceIndex].budget = budget
        recipes[pieceIndex].calories = calories
        recipes[pieceIndex].cookingTime = cookingTime
        recipes[pieceIndex].cuisine = cuisine
        recipes[pieceIndex].category = category
        recipes[pieceIndex].instructions = instructions

        
        if let newImage = image {
            do {
                try FileManager().saveImage(id: "\(recipe.id)", image: newImage)
            } catch {
                showFileAlert = true
                appError = RecipeError.ErrorType(error: error as! RecipeError)
            }
        }
        saveRecipes()
        reset()
    }
    
    func removePiece(recipe: Recipe) {
        var indexes = IndexSet()
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            indexes.insert(index)
        }
        recipes.remove(atOffsets: indexes)
        
        let imageURL = FileManager.docDirURL.appendingPathComponent("\(recipe.id).jpg")
        do {
            try FileManager().removeItem(at: imageURL)
        } catch {
            showFileAlert = true
            appError = RecipeError.ErrorType(error: error as! RecipeError)
        }
        saveRecipes()
    }
    
    func isFavoritePiece(recipe: Recipe) {
        guard let pieceIndex = recipes.firstIndex(where: { storedPiece in
            recipe.id == storedPiece.id})
        else { print("No recipe to update")
            return }
        recipes[pieceIndex].isFavorite.toggle()
        saveRecipes()
    }
    
    func saveRecipes() {
        do {
            let pieceData = try JSONEncoder().encode(recipes)
            do {
                let url = FileManager.docDirURL.appendingPathComponent(fileName)
                try pieceData.write(to: url)
            } catch {
                showFileAlert = true
                appError = RecipeError.ErrorType(error: error as! RecipeError)
            }
        } catch {
            showFileAlert = true
            appError = RecipeError.ErrorType(error: .encodingError)
        }
    }
    
    
    func loadRecipes() {
        let recipeJSONURL = FileManager.docDirURL.appendingPathComponent(fileName)
//        guard let recipeData = try? Data(contentsOf: recipeJSONURL)
//        else {
//            return starterRecipe
//        }
        do {
            let recipeData = try Data(contentsOf: recipeJSONURL)
            do {
                recipes = try JSONDecoder().decode([Recipe].self, from: recipeData)
//                return recipes
            } catch {
                showFileAlert = true
                 appError = RecipeError.ErrorType(error: .decodingError)
//                return starterRecipe
            }
        } catch {
            showFileAlert = true
            appError = RecipeError.ErrorType(error: error as! RecipeError)
//            return starterRecipe
        }
    }
    


}
