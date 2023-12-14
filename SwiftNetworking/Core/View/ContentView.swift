//
//  ContentView.swift
//  SwiftNetworking
//
//  Created by A.f. Adib on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                HStack {
                    Text("\(coin.marketCapRank)")
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading){
                        Text(coin.name)
                            .fontWeight(.semibold)
                        Text(coin.symbol.uppercased())
                    }
                }.font(.footnote)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
