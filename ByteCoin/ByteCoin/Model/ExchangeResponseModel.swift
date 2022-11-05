
import Foundation

// MARK: - Welcome
struct ExchangeResponse: Codable {
    let time, assetIDBase, assetIDQuote: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}


//  ExchangeResponseModel.swift
//  ByteCoin
//
//  Created by Pankaj Verma on 05/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
