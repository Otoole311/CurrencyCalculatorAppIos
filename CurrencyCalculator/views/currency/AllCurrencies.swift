//
//  AllCurrencies.swift
//  CurrencyCalculator
//
//  Created by Albert Essilfie on 10/6/22.
//

import SwiftUI


struct AllCurrencies: View {
    @State var symbols:[String: String] = [:]
    @State var isLoading = true
    private let requestManager = RequestManager()
    
    func fetchSymbols() async{
        do{
            let symbolsContainer: SymbolsContainer =
            try await requestManager.perform(SymbolsRequest.getAllSymbols)
            self.symbols = symbolsContainer.symbols
            await stopLoading()
        }
        catch
        {
            print(error)
        }
    }
    
    //MARK: Body
    var body: some View {
        
        NavigationView{
            List{
                ForEach([String](symbols.values), id: \.self){
                    symbol in
                    Text("\(symbol)")
                }
            }
            .task {
                await fetchSymbols()
              }
              .listStyle(.plain)
              .navigationTitle("All Currencies")
              // 3
              .overlay {
                if isLoading {
                  ProgressView("Fetching All currencies...")
                }
              }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    @MainActor
      func stopLoading() async {
        isLoading = false
      }
}

struct AllCurrencies_Previews: PreviewProvider {
    static var previews: some View {
        AllCurrencies()
    }
}
