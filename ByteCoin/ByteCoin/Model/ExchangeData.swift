//
//  ExchangeData.swift
//  ByteCoin
//
//  Created by Pankaj Verma on 05/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct ExchangeData {
    let rate: Double
    let asset: String
    let currency: String
    var formatedRate: String {
        return String(format: "%.1f", rate)
    }
}
