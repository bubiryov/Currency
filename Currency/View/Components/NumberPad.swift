//
//  NumberPad.swift
//  Currency
//
//  Created by Egor Bubiryov on 26.02.2023.
//

import SwiftUI

struct NumberPad: View {
    @Binding var amount: String
    let keyboardRows = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "⌫"]
    ]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 3), count: keyboardRows[0].count), spacing: 3) {
            ForEach(keyboardRows.indices, id: \.self) { rowIndex in
                ForEach(keyboardRows[rowIndex], id: \.self) { button in
                    Button(action: {
                        handleTap(button)
                    }) {
                        Text(button)
                            .font(.system(size: button == "⌫" ? 40 : 35))
                            .bold()
                            .foregroundColor(.primary)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                            .background(Color.secondColor)
                    }
                }
            }
        }
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    func handleTap(_ buttonTitle: String) {
        HapticManager.instance.impact(style: .light)
        switch buttonTitle {
        case "⌫":
            if amount.count == 1 {
                amount = "0"
            } else {
                amount.removeLast()
            }
        case ".":
            if !amount.contains(".") {
                amount += buttonTitle
            }
        default:
            if amount != "0" {
                if amount.count < 8 {
                    amount += buttonTitle
                }
            } else {
                amount = buttonTitle
            }
        }
    }
}

struct NumberPad_Previews: PreviewProvider {
    static var previews: some View {
        NumberPad(amount: .constant("100"))
    }
}
