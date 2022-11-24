//
//  MyWebView.swift
//  NB News
//
//  Created by Pankaj Verma on 25/11/22.
//

import SwiftUI
import WebKit

struct MyWebVew: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> MyWebVew.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
 
