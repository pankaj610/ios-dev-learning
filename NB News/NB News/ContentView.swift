//
//  ContentView.swift
//  H4XOR News
//
//  Created by Pankaj Verma on 25/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink( destination: DetailView(url: post.url)) {
                    VStack {
                        Text(post.title).font(.headline)
                        AsyncImage(url: URL(string: post.urlToImage),
                           content: { image in
                                image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 300, maxHeight: 200)
                            },
                           placeholder: {
                                  Text("Loading")
                           }
                        )
                        .frame(width: 300, height: 200)
                        Text(post.content).font(.body)
                    }
                }
            }
            .navigationTitle("NB News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


 
