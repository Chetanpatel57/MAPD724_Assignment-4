//
//  RecipeList.swift
//  MyRecipeHub
//  //  Version: v1.0.0
//  Created by Nirav Goswami on 2023-03-21.
//
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//

import SwiftUI

struct RecipeList: View {
    @State var recipes : [Recipe]
    @State var stateview : Bool = false
    @EnvironmentObject var recipeVM : RecipeViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    .padding(.leading)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                if stateview || !stateview{
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
            .padding(.top)
            .onAppear {
                if recipeVM.isFavView {
                    recipes = recipeVM.favrecipes
                }
                stateview.toggle()
            }
        }
        .padding(.horizontal)
        
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList(recipes: Recipe.all)
                .environmentObject(RecipeViewModel())
        }
    }
}


