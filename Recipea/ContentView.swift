//
//  ContentView.swift
//  Recipea
//
//  Created by Orri Arnórsson on 25.8.2023.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
            NavigationView {
                NavigationLink(destination: RecipeView()) {
                    Text("View Recipe")
                }
                
            }
            .navigationTitle("Main View")

    }
}

#Preview {
    ContentView()
}
