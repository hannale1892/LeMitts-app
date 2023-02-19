//
//  Piece.swift
//  Piece
//
//  Created by Hang Le on 9.6.2022.
//
import Foundation
import UIKit

struct Recipe: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    
    var serving: Int
    var budget: Int
    var calories: Int
    var cookingTime: Int
    
    var cuisine: Cuisine
    var category: Category
    
    var ingredients: String
    var instructions: String
    var isFavorite: Bool
    let date: Date
    
    var imageName: String
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(named: imageName)!
        }
    }

}

extension Recipe {
    static let sampleData: [Recipe] =
    [
        Recipe(name: "Extra Cheesy Garlic Bread", serving: 12, budget: 20, calories: 435, cookingTime: 30, cuisine: .american, category: .sideDish,
               ingredients: "1 (16 ounce) loaf French bread cut in half lengthwise\n1/2 cup butter (1 stick) softened\n4 cloves garlic minced\n1 teaspoon garlic powder\n1/2 teaspoon Italian seasoning\n1 tablespoon fresh parsley chopped + extra for serving\n1/4 teaspoon salt\nPepper to taste\n1 cup freshly grated parmesan cheese\n2 cups shredded mozzarella cheese",
               instructions: "Take the butter out of the fridge at least an hour prior to starting the recipe.\nPreheat your oven to 400F and move the rack to the top third of the oven.\nAdd the butter, garlic, garlic powder, Italian seasoning, parsley, and salt & pepper to a small bowl. Mash together with a fork until well combined",
               isFavorite: false, date: Date(), imageName: "cheesy-garlic-bread-2"
              ),
        Recipe(name: "Chicken Pad Thai", serving: 3, budget: 25, calories: 335, cookingTime: 30, cuisine: .asian, category: .mainCourse,
               ingredients: "125 g / 4oz Chang’s Pad Thai dried rice sticks\n\nSAUCE:\n1 1/2 tbsp tamarind puree\n3 tbsp (packed) brown sugar\n2 tbsp fish sauce (Note 3)\n1 1/2 tbsp oyster sauce\n\nSTIR FRY:\n2 – 3 tbsp vegetable or canola oil\n1/2 onion , sliced (brown, yellow)\n2 garlic cloves , finely chopped\n150 g/5oz chicken breast (or thigh) , thinly sliced\n2 eggs , lightly whisked\n1 1/2 cups of beansprouts\n1/2 cup firm tofu, cut into 3cm / 1 1/4″ batons\n1/4 cup garlic chives , cut into 3cm / 1 1/4″ pieces\n1/4 cup finely chopped peanuts",
               instructions: "Place noodles in a large bowl, pour over plenty of boiling water. Soak for 5 minutes, then drain in a colander and quickly rinse under cold water. Don’t leave them sitting around for more than 5 – 10 minutes.\n\nMix Sauce in small bowl.\n\nHeat 2 tbsp oil in a large non stick pan (or well seasoned skillet) over high heat. Add garlic and onion, cook for 30 seconds.\n\nAdd chicken and cook for 1 1/2 minutes until mostly cooked through.\n\nPush to one side of the pan, pour egg in on the other side. Scramble using the wooden spoon (add touch of extra oil if pan is too dry), then mix into chicken.\n\nAdd bean sprouts, tofu, noodles then Sauce.\nToss gently for about 1 1/2 minutes until Sauce is absorbed by the noodles.\n\nAdd garlic chives and half the peanuts. Toss through quickly then remove from heat.\nServe immediately, sprinkled with remaining peanuts and lime wedges on the side, with a sprinkle of chilli and a handful of extra beansprouts on the side if desired (this is the Thai way!). Squeeze over lime juice to taste before eating.",
               isFavorite: true, date: Date(), imageName: "chicken-pad-thai-square"),
        Recipe(name: "Strawberry Smoothie", serving: 2, budget: 15, calories: 245, cookingTime: 30, cuisine: .european, category: .dessert,
               ingredients: "2 cups frozen strawberries\n1 banana (room temperature)\n¼ cup Greek yogurt*\n1 cup milk (or almond milk or oat milk)\n1 ½ tablespoons maple syrup, honey, or agave syrup\n½ cup ice\nOptional add-ins: 1 tablespoon almond butter, ¼ teaspoon vanilla, fresh mint leaves or basil leaves",
               instructions: "Place all ingredients in a blender, breaking the banana into pieces. Blend until creamy and frothy, stopping and scraping down the sides as necessary. If desired, garnish with a frozen strawberry and mint sprig. Serve immediately or store in a covered jar in the refrigerator for 2 days.",
               isFavorite: false, date: Date(), imageName: "Chia-Seed-Smoothie-4"),
        Recipe(name: "Easy Cheesy Taco Pasta", serving: 4, budget: 15, calories: 620, cookingTime: 30, cuisine: .european, category: .mainCourse,
               ingredients: "8 ounces uncooked pasta\n1 pound extra lean ground beef\n1 tablespoon chili powder\n1 teaspoon ground cumin\n1 teaspoon garlic powder\n1 teaspoon smoked paprika\n1/2 red bell pepper chopped\n1 (10 fluid ounce) can Ro-tel diced tomatoes & green chilies with juices\n1 cup grated cheddar cheese I used sharp cheddar\n1/2 cup heavy/whipping cream\nSalt & pepper to taste\nOptional garnish: chopped scallions and cilantro",
               instructions: "Boil a salted pot of water for your pasta. Cook pasta al dente according to package directions.\n\nMeanwhile, prep your other ingredients and start browning the beef with the spices over medium-high heat in a skillet (approx. 8-10 minutes). Add the red pepper once the meat is broken up a bit and starts to brown.\n\nIf you didn't use very lean ground beef, drain most of the excess fat. Add the Rotel tomatoes, cheese, and the cream. Cook for a few more minutes.\n\nDrain the pasta and toss with the sauce. Season with salt & pepper and garnish as desired.",
               isFavorite: false, date: Date(), imageName: "taco-pasta-1"),
        Recipe(name: "Strawberry Cake", serving: 4, budget: 20, calories: 410, cookingTime: 40, cuisine: .american, category: .mainCourse,
               ingredients: "3 1/4 cups all-purpose flour\n4 teaspoons baking powder\n1 teaspoon salt\n1 cup unsalted butter ,softened to room temperature\n2 cups granulated sugar",
               instructions: "Make the reduced strawberry puree and allow it to cool completely. See note. You can make it a few days ahead of time and store it covered in the refrigerator or cover and freeze it for up to 3 months. Thaw before using in the recipe.\n\nPreheat the oven to 350°F (177°C). Grease and lightly flour two 9-inch cake pans.\n\nWhisk the cake flour, baking powder, baking soda, and salt together. Set aside.",
               isFavorite: false, date: Date(), imageName: "Strawberry-Cake-S1"),

        Recipe(name: "Truffled Mushroom Naan Pizza", serving: 2, budget: 18, calories: 620, cookingTime: 45, cuisine: .european, category: .meatless,
               ingredients: "2 naans\n1 tablespoon olive oil + 2 teaspoons olive oil\n1/2 medium onion chopped\n8 ounces white mushrooms sliced thin\n3-4 cloves garlic minced\n4 dashes Italian seasoning\nSalt & pepper to taste\n1.5 cups grated Fontina cheese\nTruffle oil to taste\nChopped parsley to taste (optional)",
               instructions: "Heat 1 tablespoon of olive oil in a skillet on medium-high heat. Add the onion once the oil is hot, and sauté for 5 minutes. Add the mushrooms, garlic, Italian seasoning, and salt & pepper, then cook for another 5 minutes, stirring occasionally, until everything has softened, and the liquid is released from the mushrooms.\n\nMeanwhile, set your oven's broiler to high and move the rack to the top third of the oven.\n\nPlace the naans on a non-stick baking sheet. Drizzle a teaspoon of olive oil onto each naan. Top each naan with the mushrooms followed by the cheese.\n\nBroil for 5-6 minutes, or until the cheese is melted and bubbly. Drizzle the truffle oil on top of each pizza, and sprinkle with parsley. Serve immediately.",
               isFavorite: false, date: Date(), imageName: "truffled-mushroom-naan-pizza-1")
    ]
}

