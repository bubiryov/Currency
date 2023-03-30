//
//  Extensions.swift
//  Currency
//
//  Created by Egor Bubiryov on 22.02.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let secondColor = Color("SecondColor")
}

extension Date {
    func formatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: self)
    }
}

/*
 Для отображения в консоли всех шрифтов - запустить при инициализации
 
 for familyName in UIFont.familyNames {
 print (familyName)
 for fontName in UIFont.fontNames (forFamilyName: familyName) {
 print("--- \(fontName)")
 }
 }
 */
