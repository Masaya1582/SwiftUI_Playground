//
//  CurrencyConverter.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct CurrencyConverter {
    let usdToEuroRate = 0.85

    func convertUSDToEuro(usdAmount: Double) -> Double {
        return usdAmount * usdToEuroRate
    }
}
