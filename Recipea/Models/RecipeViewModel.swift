//
//  RecipeViewModel.swift
//  Recipea
//
//  Created by Orri Arnórsson on 25.8.2023.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    
    init() {
        fetchRecipe()
    }
    
    func fetchRecipe() {
        guard let url = URL(string: "https://raw.githubusercontent.com/skratchattack/Uppskriftir/main/carrotcake.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedRecipe = try JSONDecoder().decode(Recipe.self, from: data)
                    DispatchQueue.main.async {
                        self.recipe = decodedRecipe
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
        }.resume()
    }
}
