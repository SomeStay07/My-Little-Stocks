//
//  NewsSheetView.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 24.02.2021.
//

import SwiftUI

struct NewsSheetView: View {
    
    @Binding private var newsOpen: Bool
    @ObservedObject private var newsManager: NewsDownloadManager
    
    init(newsOpen: Binding<Bool>, newsManager: NewsDownloadManager) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self._newsOpen = newsOpen
        self.newsManager = newsManager
    }
    
    var body: some View {
        BottomSheetView(isOpen: $newsOpen, maxHeight: UIScreen.main.bounds.height * 0.89) {
            ZStack {
                Color.white
                
                Rectangle().fill(Color.black.opacity(0.8))
                
                VStack(alignment: .leading) {
                    NewsHeaderView()
                    Spacer()
                    NewsListView(newsManager: newsManager)
                }.padding()
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}
