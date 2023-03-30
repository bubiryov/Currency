//
//  CurrencyApp.swift
//  Currency
//
//  Created by Egor Bubiryov on 20.02.2023.
//

import SwiftUI

@main
struct CurrencyApp: App {
    @StateObject var vm = CurrencyViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
