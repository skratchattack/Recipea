//
//  Recipe.swift
//  Recipea
//
//  Created by Orri Arnórsson on 25.8.2023.
//

import Foundation

struct Recipe: Codable {
    let title: String
    let category: String
    let ingredients: [Ingredient]
    
    
    enum CodingKeys: String, CodingKey {
        case title, category, ingredients
    }
    

}

struct Ingredient: Codable {
    let name: String
    let amount: String
    let state: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name, amount, state
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        amount = try container.decode(String.self, forKey: .amount)
        
        if let stateArray = try? container.decode([String].self, forKey: .state) {
            state = stateArray
        } else if let singleState = try? container.decode(String.self, forKey: .state) {
            state = [singleState]
        } else {
            state = nil
        }
    }
}

