//
//  Currency.swift
//  Currency
//
//  Created by Egor Bubiryov on 20.02.2023.
//

import Foundation

struct Currency: Codable {
    let success: Bool
    let base, date: String
    let rates: [String: Double]
}
