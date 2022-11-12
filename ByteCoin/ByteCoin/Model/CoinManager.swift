//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateExchangeRate(_ coinManager: CoinManager, exchangeData: ExchangeData)
}

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C43FD558-736C-4EF0-856B-B89FF81B83C1"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(currency: String)  {
        performRequest(with: "\(baseURL)/\(currency)?apikey=\(apiKey)")
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let exchangeDataObj = parseExchangeInfo(safeData) {
                        delegate?.didUpdateExchangeRate(self, exchangeData: exchangeDataObj)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseExchangeInfo(_ exchangeData: Data) -> ExchangeData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ExchangeResponse.self, from: exchangeData)
            let exchangeModal = ExchangeData(rate: decodedData.rate, asset: decodedData.assetIDBase, currency: decodedData.assetIDQuote)
            return exchangeModal
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
