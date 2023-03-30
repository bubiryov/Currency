//
//  CurrencyViewModel.swift
//  Currency
//
//  Created by Egor Bubiryov on 20.02.2023.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    @Published var currencyData: Currency = Currency(success: true, base: "", date: "", rates: ["":0])
    
    @Published var favoritesList: [String] = ["USD", "UAH", "EUR"] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.favoritesList) {
                UserDefaults.standard.setValue(encoded, forKey: "FAVORITES")
            }
        }
    }
    
    @Published var isActivated = false
    @Published var bases = ["MRU", "BOB", "XAU", "KMF", "PHP", "NZD", "KPW", "ERN", "UGX", "HRK", "HUF", "DKK", "BSD", "NOK", "TMT", "RUB", "NAD", "XPD", "PLN", "SSP", "SRD", "GBP", "CDF", "COP", "KZT", "MDL", "CUP", "MKD", "MNT", "AWG", "TTD", "CUC", "USD", "KGS", "MZN", "PGK", "MYR", "INR", "KHR", "XOF", "UYU", "SHP", "AZN", "LRD", "SOS", "EUR", "SVC", "PYG", "XDR", "SDG", "SZL", "SGD", "RSD", "QAR", "NPR", "XAG", "KWD", "BMD", "THB", "GGP", "HKD", "ETB", "RWF", "UZS", "BIF", "TND", "CNY", "AED", "BTC", "AMD", "SAR", "HNL", "LYD", "PEN", "FJD", "VND", "XPT", "JOD", "JEP", "KRW", "CNH", "VES", "RON", "DZD", "BAM", "WST", "EGP", "ZWL", "CAD", "XPF", "GEL", "SLL", "ISK", "TZS", "GTQ", "DJF", "GYD", "BRL", "YER", "CZK", "VUV", "GMD", "CRC", "CLF", "ZMW", "JMD", "LAK", "BHD", "TJS", "MXN", "ILS", "OMR", "AUD", "MGA", "BGN", "BWP", "BTN", "GHS", "CHF", "DOP", "TRY", "IQD", "LSL", "MMK", "BND", "CVE", "ARS", "NGN", "BZD", "MOP", "IRR", "TWD", "XAF", "GNF", "AFN", "JPY", "HTG", "TOP", "NIO", "MWK", "IDR", "MAD", "BYN", "CLP", "STN", "BBD", "MVR", "KES", "LBP", "MUR", "SYP", "UAH", "IMP", "AOA", "KYD", "PAB", "ZAR", "GIP", "STD", "PKR", "FKP", "SCR", "SEK", "XCD", "ANG", "BDT", "ALL", "LKR", "SBD"].sorted()
    
    func fetchData() async throws {
        guard let url = URL(string: "https://api.exchangerate.host/latest?base=USD&amount=1") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(Currency.self, from: data) {
                print(url)
                await MainActor.run(body: {
                    currencyData = decodedData
                })
                print(currencyData)
            } else {
                throw URLError(.badURL)
            }
        } catch  {
            print("Can not get data")
        }
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    func getResult(fromBase: String, toBase: String, amount: String) -> String {
        
        let first: Double = currencyData.rates[fromBase] ?? 0
        let second: Double = currencyData.rates[toBase] ?? 0
        let amount: Double = Double(amount) ?? 0
        
        let doubleResult = (second/first)*amount
        let stringResult = String(format: "%0.2f", doubleResult)
        
        return stringResult
    }
    
    init() {
        if let bases = UserDefaults.standard.data(forKey: "FAVORITES") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: bases) {
                self.favoritesList = decoded
                return
            }
        }
    }
}
