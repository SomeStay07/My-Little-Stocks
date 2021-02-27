//
//  CustomTextField.swift
//  MyLittleStocks
//
//  Created by Тимур Чеберда on 22.02.2021.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: Text
    
    @Binding var text: String
    
    var editingOnChanged: (Bool) -> Void = { _ in }
    
    var commit: () -> Void = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingOnChanged, onCommit: commit)
        }
    }
}
