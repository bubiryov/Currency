//
//  HomeView.swift
//  Currency
//
//  Created by Egor Bubiryov on 21.02.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: CurrencyViewModel
    @State private var firstBase: String = "USD"
    @State private var secondBase: String = "UAH"
    @State private var amount: String = "0"
    @State private var result: String = "0.00"
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                Title(date: vm.getFormattedDate())
                
                ZStack {
                    VStack(spacing: 3) {
                        ConverterRectangle(base: $firstBase, count: amount, bases: vm.favoritesList)
                        ConverterRectangle(base: $secondBase, count: result, bases: vm.favoritesList)
                    }
                    .cornerRadius(20)
                    .padding()
                    .onChange(of: firstBase) { newValue in
                        result = vm.getResult(fromBase: firstBase, toBase: secondBase, amount: amount)
                    }
                    .onChange(of: secondBase) { newValue in
                        result = vm.getResult(fromBase: firstBase, toBase: secondBase, amount: amount)
                    }
                    .onChange(of: amount) { newValue in
                        result = vm.getResult(fromBase: firstBase, toBase: secondBase, amount: amount)
                    }
                    
                    ArrowsButton(amount: $amount, result: $result, firstBase: $firstBase, secondBase: $secondBase)
                        .offset(x: 80)
                }
                
                NumberPad(amount: $amount)
            }
            .onAppear {
                if !vm.isActivated {
                    Task {
                        try await vm.fetchData()
                    }
                    vm.isActivated = true
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color.background)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.primary)
                            .font(.system(size: 20))
                    }
                }
            }            
        }
        .tint(.primary)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CurrencyViewModel())
    }
}
