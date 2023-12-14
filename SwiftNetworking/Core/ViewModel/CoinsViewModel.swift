//
//  CoinsViewModel.swift
//  SwiftNetworking
//
//  Created by A.f. Adib on 12/12/23.
//

import Foundation

class CoinsViewModel : ObservableObject {
    @Published var coins = [Coin]()
  
    
    private let service = CoinDataService()
    
    init() {
//        fetchPrice(coin: "litecoin")
        fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
//    func fetchPrice (coin : String) {
//
//        service.fetchPrice(coin: coin) { priceFromService in
//            //Converting bgThread to MainThread
//            DispatchQueue.main.async {
//                self.price = "\(priceFromService)"
//                self.coin = coin
//            }
//        }
//    }
}
