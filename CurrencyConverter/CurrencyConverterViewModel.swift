//
//  CurrencyConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Frida Dahlqvist on 2024-04-17.
//

import Foundation

class CurrencyConverterViewModel: ObservableObject {
    @Published var sekAmount: String = ""
    @Published var convertedAmounts: [String] = []
    
    private let exchangeRates: [Currency] = [
            Currency(code: "EUR", rate: 0.092),
            Currency(code: "USD", rate: 0.10),
            Currency(code: "GBP", rate: 0.08)
        ]

        func convertAmount() {
            guard let sek = Double(sekAmount) else {
                convertedAmounts = ["Invalid input"]
                return
            }
            convertedAmounts = exchangeRates.map { currency in
                let convertedValue = sek * currency.rate
                return "\(currency.code): \(String(format: "%.2f", convertedValue))"
            }
        }
    }
