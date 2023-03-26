//
//  ContentView.swift
//  MyRecipeHub
//  Version: v1.0.0
//  Created by Nirav Goswami on 2023-03-21.
//
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Tabbar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}
