//
//  WebKitView.swift
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
import WebKit

struct WebKitView: View {
    var urltoopen : String
    var body: some View {
        WebView(request: URLRequest(url: URL(string: urltoopen)!))
    }
}

struct WebKitView_Previews: PreviewProvider {
    static var previews: some View {
        WebKitView(urltoopen: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(request)
    }
}


