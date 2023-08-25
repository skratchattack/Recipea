//
//  RecipeView.swift
//  Recipea
//
//  Created by Orri Arnórsson on 25.8.2023.
//

import SwiftUI

struct RecipeView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            if let ingredients = viewModel.recipe?.ingredients {
                List(ingredients.indices, id: \.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(ingredients[index].name)")
                            if let stateArray = ingredients[index].state, !stateArray.isEmpty {
                                            ForEach(stateArray, id: \.self) { state in
                                                Text(state)
                                                    .foregroundColor(Color.gray)
                                                    .padding(.leading, 7)
                                                    .font(.system(size:14))
                                            }
                                        }
                            
                        }
                        Spacer()
                            Text(ingredients[index].amount)
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.fetchRecipe()
        }
    }
}
#Preview {
    RecipeView()
}
