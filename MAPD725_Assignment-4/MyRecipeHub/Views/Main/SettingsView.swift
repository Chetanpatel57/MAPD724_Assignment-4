//
//  SettingsView.swift
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

struct SettingsView: View {
    @State var statusbool : Bool = false
    @State private var  darkmode : Bool = false
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State var version: String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")
    @State private var showAboutUsAlert = false
    var body: some View {
        NavigationView{
            List(content: {
                HStack {
                    Text("App version")
                        .font(.headline)
                    Spacer()
                    Text(version)
                        .font(.headline)
                }
                HStack {
                    Text("Dark Mode")
                        .font(.headline)
                    Spacer()
                    Toggle(isOn: $darkmode) {
                        Text("\(setdarkmodeuserdefault(value: darkmode))")
                    }.tint(.gray)
                }
                Button {
                    shareApp()
                } label: {
                    Text("Share App")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                Button {
                    self.showAboutUsAlert = true
                } label: {
                    Text("About Us")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                
            })
            .navigationTitle("Settings")
            .alert(isPresented: $showAboutUsAlert) {
                Alert(title: Text("About US"), message: Text(Constants.aboutusText.rawValue), dismissButton: .default(Text("OK")))
            }
        }.navigationViewStyle(.stack)
    }
    
    func setdarkmodeuserdefault(value:Bool) -> String{
        let userInfo: [AnyHashable: Any] = ["isOn": value]
        NotificationCenter.default.post(name: Notification.Name("DARKMODE"), object: nil, userInfo: userInfo)
        return ""
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(RecipeViewModel())
    }
}

extension SettingsView {
    func shareApp(){
        let url = URL(string: Constants.appshareurl.rawValue)
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let windows = windowScene.windows
            windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
        }
    }
    
    
}
