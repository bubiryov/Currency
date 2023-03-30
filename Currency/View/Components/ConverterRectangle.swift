//
//  ConverterRectangle.swift
//  Currency
//
//  Created by Egor Bubiryov on 26.02.2023.
//

import SwiftUI

struct ConverterRectangle: View {
    @Binding var base: String
    var count: String
    var bases: [String]
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxHeight: UIScreen.main.bounds.height
                       * 0.15)
                .foregroundColor(.secondColor)
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Picker(base, selection: $base) {
                        ForEach(bases, id: \.self) {
                            Text($0)
                        }
                    }
                    .tint(.secondary)
                    
                    Text(count)
                        .font(.system(size: 50))
                        .lineLimit(1)
                        .minimumScaleFactor(0.65)
                        .padding(.horizontal)
                }
                .frame(width: 200, alignment: .leading)
                Spacer()
            }
        }
    }
}

struct ConverterRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ConverterRectangle(base: .constant("USD"), count: "100", bases: ["Bases"])
    }
}
