//
//  CategoryView.swift
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

struct CategoryView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var category : Category
    var recipes : [Recipe]  {
        return recipeVM.recipes.filter{$0.category == category.rawValue}
    }
    var body: some View {
        ScrollView{
            RecipeList(recipes:recipes)
        }
        .navigationTitle(category.rawValue+"s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.main)
            .environmentObject(RecipeViewModel())
    }
}
