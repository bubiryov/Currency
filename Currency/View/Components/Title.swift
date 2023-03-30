//
//  Title.swift
//  Currency
//
//  Created by Egor Bubiryov on 26.02.2023.
//

import SwiftUI

struct Title: View {
    var date: String
    var body: some View {
        HStack {
            Text("Converter")
                .font(.system(size: 40))
            Spacer()
            Text(date)
                .foregroundColor(.secondary)
                .bold()
        }
        .padding(.horizontal)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(date: "21.02.2023")
    }
}
