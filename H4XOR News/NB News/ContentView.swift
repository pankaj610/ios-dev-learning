//
//  ContentView.swift
//  H4XOR News
//
//  Created by Pankaj Verma on 25/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Hello")
                Text("World")
            }
            .navigationTitle("NB News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
