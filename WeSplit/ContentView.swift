//
//  ContentView.swift
//  WeSplit
//
//  Created by Daren Darnell on 7/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var total = 0.0
    @State private var tip = 0
    @State private var numPeople = 1
    
    private var grandTotal : Double {
        let tipPercent = Double(tip)/100
        return total + (total * tipPercent)
    }
    
    private var splitTotal : Double {
        return grandTotal / Double(numPeople+2)
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Check Total & Tip Percentage") {
                    TextField("Check total", value: $total, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                    Picker("Tip percentage", selection: $tip) {
                        ForEach(0..<100){
                            Text("\($0)%")
                        }
                    }.pickerStyle(.navigationLink)
                }
                Section("Number of people") {
                    Picker("Number of people", selection: $numPeople) {
                        ForEach(2..<11){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Grand Total") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person") {
                    Text(splitTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
