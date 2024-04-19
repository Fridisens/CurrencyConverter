//
//  CurrencyConverterView.swift
//  CurrencyConverter
//
//  Created by Frida Dahlqvist on 2024-04-17.
//

import SwiftUI

struct CurrencyConverterView: View {

@State private var sekAmount: String = ""
    
    // Hårdkodade växelkurser
    let exchangeRates = [
        "EUR": 0.086,
        "USD": 0.091,
        "GBP": 0.073,
        "YEN": 14.08,
        
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SEK")) {
                    TextField("Ange belopp i SEK", text: $sekAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Konverterade belopp")) {
                    ForEach(exchangeRates.sorted(by: >), id: \.key) { currency, rate in
                        Text("\(currency): \(convertedAmount(for: currency))")
                    }
                }
            }
            .navigationBarTitle("Valutaomvandlare", displayMode: .inline)
        }
    }
    
    // Funktion för att räkna om till andra valutor
    func convertedAmount(for currency: String) -> String {
        guard let sek = Double(sekAmount), let rate = exchangeRates[currency] else {
            return "Ange ett giltigt belopp"
        }
        return String(format: "%.2f", sek * rate)
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            CurrencyConverterView()
        }
    }
}
