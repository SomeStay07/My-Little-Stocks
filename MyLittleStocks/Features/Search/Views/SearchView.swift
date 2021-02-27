//
//  SearchView.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 27.02.2021.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    
    @ObservedObject private var searchManager = SearchManager()
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack {
                HStack {
                    SearchTextView(searchTerm: $searchTerm)
                    Button(action:  {
                        searchManager.searchStocks(keyword: searchTerm)
                    }) {
                        Image(systemName: "arrowtriangle.right.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                
                ScrollView {
                    ForEach(searchManager.searches) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.symbol)
                                    .font(.title)
                                    .bold()
                                
                                Text(item.type)
                                    .font(.body)
                            }
                            
                            Spacer()
                            
                            Text(item.name)
                            
                            Spacer()
                            
                            Button(action: {
                                UserDefaultsManager.shared.set(symbol: item.symbol)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
                        }.foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 1)
                    }
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 16)
            
        }.edgesIgnoringSafeArea(.all)
    }
}

