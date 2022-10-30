//
//  WeatherManager.swift
//  Clima
//
//  Created by Pankaj Verma on 29/10/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let whetherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=8d40a37fb20c499f232b4e38a64587b2&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(whetherUrl)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 1. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 5. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJson(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            }
            
            // 4. Resume the task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherModal = WeatherModel(weatherId: decodedData.weather[0].id
                                            , cityName: decodedData.name
                                            , temperature: decodedData.main.temp )
            return weatherModal
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
    
}
