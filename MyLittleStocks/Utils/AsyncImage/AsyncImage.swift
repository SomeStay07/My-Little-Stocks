//
//  AsyncImage.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 25.02.2021.
//

import SwiftUI

struct AsyncImage<PlaceHolderView: View>: View {
    
    @StateObject private var loader: ImageLoader
    
    private let placeholder: PlaceHolderView
    private let image: (UIImage) -> Image
    
    init(
        url                     : URL,
        @ViewBuilder placeholder: () -> PlaceHolderView,
        @ViewBuilder image      : @escaping (UIImage) -> Image = Image.init(uiImage: )
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
}
