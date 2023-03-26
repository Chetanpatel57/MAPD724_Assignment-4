//
//  CategoriesView.swift
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

struct CategoriesView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var body: some View {
        NavigationView{
            List(content: {
                ForEach(Category.allCases,id: \.self) { category in
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        Text(category.rawValue+"s")
                    }
                }
            })
                .navigationTitle("Categories")
        }.navigationViewStyle(.stack)
            .onAppear {
            self.recipeVM.isFavView = false
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(RecipeViewModel())
    }
}
