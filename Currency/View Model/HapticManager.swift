//
//  HapticManager.swift
//  Currency
//
//  Created by Egor Bubiryov on 26.02.2023.
//

import Foundation
import UIKit

class HapticManager {
    static let instance = HapticManager()
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
