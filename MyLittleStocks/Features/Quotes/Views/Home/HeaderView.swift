//
//  HeaderView.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()
    
    @Binding var stocks: [String]
    
    @State private var showSearch = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -5) {
                Text("Stocks")
                    .foregroundColor(.white)
                    .bold()
                
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
                    .bold()
            }.font(.title)
            
            Spacer()
            
            Button {
                showSearch.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }.sheet(isPresented: $showSearch, onDismiss: {
                self.stocks = UserDefaultsManager.shared.savedSymbols
            }, content: {
                SearchView()
            })
        }.background(Color.black)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks: .constant(["AAPL", "GOOG"]))
    }
}
