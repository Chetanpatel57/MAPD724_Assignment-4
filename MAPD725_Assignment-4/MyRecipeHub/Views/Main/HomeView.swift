//
//  HomeView.swift
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

struct HomeView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State private var darkmode : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                RecipeList(recipes: recipeVM.recipes)
            }
            .navigationTitle("My Recipes")
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("DARKMODE"))) { notification in
                if let isOn = notification.userInfo?["isOn"] as? Bool {
                    darkmode = isOn
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            self.recipeVM.isFavView = false
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: Notification.Name("DARKMODE"), object: nil)
        }
        .preferredColorScheme(darkmode ? .dark : .light)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}
