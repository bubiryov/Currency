//
//  ArrowsButton.swift
//  Currency
//
//  Created by Egor Bubiryov on 26.02.2023.
//

import SwiftUI

struct ArrowsButton: View {
    @Binding var amount: String
    @Binding var result: String
    @Binding var firstBase: String
    @Binding var secondBase: String
    @State private var isFlipped = false
    
    var body: some View {
        Button {
            changeCounts()
            isFlipped.toggle()
        } label: {
            Image(systemName: "arrow.up.arrow.down")
                .foregroundColor(.secondary)
                .font(.system(size: 25))
                .bold()
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isFlipped ? 180 : 0))
        }
        .background(Color.secondColor)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.background, lineWidth: 3))
    }
    
    func changeCounts() {
        let tempSum = amount
        amount = result
        result = tempSum
        
        let tempBase = firstBase
        firstBase = secondBase
        secondBase = tempBase
    }
}

struct ArrowsButton_Previews: PreviewProvider {
    static var previews: some View {
        ArrowsButton(amount: .constant("100"), result: .constant("100"), firstBase: .constant("USD"), secondBase: .constant("UAH"))
    }
}
