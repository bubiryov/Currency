//
//  ContentView.swift
//  Currency
//
//  Created by Egor Bubiryov on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: CurrencyViewModel
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CurrencyViewModel())
    }
}
