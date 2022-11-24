//
//  NetworkManager.swift
//  NB News
//
//  Created by Pankaj Verma on 25/11/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Article]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/everything?apiKey=71a156dfd8ce4196a504d5a1b3b6abf0&q=tesla") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                print(error)
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let parsedResponse = try decoder.decode(NewsResponse.self, from: safeData)
                            print(parsedResponse.articles)
                            self.posts = parsedResponse.articles
                        } catch {
                            print(error)
                        }
                    }
                }
               
            }
            task.resume()
        }
         
    }
}


//71a156dfd8ce4196a504d5a1b3b6abf0
