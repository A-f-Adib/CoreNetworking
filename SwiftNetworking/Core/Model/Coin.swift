//
//  Coin.swift
//  SwiftNetworking
//
//  Created by A.f. Adib on 12/13/23.
//

import Foundation

struct Coin : Codable, Identifiable {
    let id : String
    let symbol : String
    let name : String
    let currentPrice : Double
    let marketCapRank : Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }
    
}
