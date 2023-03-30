//
//  SettingsView.swift
//  Currency
//
//  Created by Egor Bubiryov on 24.02.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: CurrencyViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var searchable = ""
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchable)
                    .textInputAutocapitalization(.characters)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(colorScheme == .dark ? Color.background : Color.secondary.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.top)
                    .padding(.horizontal)
                
                List(vm.bases.filter({searchable.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchable)}), id: \.self) { base in
                    let isFavorite = vm.favoritesList.contains(base)
                    Button {
                        if isFavorite && vm.favoritesList.count > 1 {
                            if let index = vm.favoritesList.firstIndex(of: base) {
                                vm.favoritesList.remove(at: index)
                            }
                        } else {
                            vm.favoritesList.append(base)
                        }
                    } label: {
                        HStack {
                            Image(systemName: isFavorite ? "star.fill" : "star")
                                .font(.system(size: 20))
                                .foregroundColor(isFavorite ? .yellow : .primary)
                            Text(base)
                                .padding(.leading)
                                .bold()
                                .padding(.vertical, 10)
                        }
                    }
                    
                }
                .listStyle(.inset)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(CurrencyViewModel())
    }
}
