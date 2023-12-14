//
//  CoinDataService.swift
//  SwiftNetworking
//
//  Created by A.f. Adib on 12/13/23.
//

import Foundation
import SwiftUI

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    
    
    func fetchCoins(completion : @escaping([Coin]) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
            
                print("Failed to decode Coins")
                return
            }
            
           completion(coins)
            
        }.resume()
    }
    
    
    
    func fetchPrice(coin : String, completion : @escaping(Double) -> Void) {
        
       //Making URL
       let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
         
           
                 //Checking URL Error
                 if let error = error {
                     print("Debug : Failed to load URL. \(error.localizedDescription)")
                 }
                 
                 
                 //Checking Response for URL
                 guard let httpResponse = response as? HTTPURLResponse else {
                     print("Bad http respose")
                     return
                 }
                 guard httpResponse.statusCode == 200 else {
                     print("Failed to load with status code \(httpResponse.statusCode)")
                     return
                 }
                 
                 
                 //Fetching Data
                 guard let data = data else { return }
                 guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
                     print(jsonObject)
                     
                 guard let value = jsonObject[coin] as? [String : Double] else { return }
                 guard let price = value["usd"] else { return }
                 
                 completion(price)
            
            
        }.resume()
    }
}
