//
//  TemperatureView.swift
//  conversionTool
//
//  Created by Charles Michael on 12/31/24.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var temperature = 0
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Celcius"
    @FocusState private var tempIsFocused: Bool
    
    var result: Double {
        if inputUnit == "Celcius" && outputUnit == "Celcius" {
            return Double(temperature)
        }
        if inputUnit == "Celcius" && outputUnit == "Farenheit" {
            return Double(temperature) * 9 / 5 + 32
        }
        if inputUnit == "Celcius" && outputUnit == "Kelvin" {
            return Double(temperature)  + 273.15
        }
        if inputUnit == "Farenheit" && outputUnit == "Farenheit" {
            return Double(temperature)
        }
        if inputUnit == "Farenheit" && outputUnit == "Celcius" {
            return (Double(temperature) - 32 ) * 5 / 9
        }
        if inputUnit == "Farenheit" && outputUnit == "Kelvin" {
            return (Double(temperature)  - 32) * 5 / 9 + 273.15
        }
        if inputUnit == "Kelvin" && outputUnit == "Kelvin" {
            return Double(temperature)
        }
        if inputUnit == "Kelvin" && outputUnit == "Celcius" {
            return Double(temperature) - 273.15
        }
        if inputUnit == "Kelvin" && outputUnit == "Farenheit" {
            return (Double(temperature)  - 32) * 5 / 9 - 273.15
        }
        return 0
    }
   
    let units = ["Farenheit", "Celcius", "Kelvin"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a temperature"){
                    HStack {
                        TextField("enter temperature", value: $temperature,  format:.number)
                            .keyboardType(.decimalPad)
                            .focused($tempIsFocused)
                        Picker("", selection: $inputUnit) {
                            ForEach(units, id:\.self){
                                Text($0)
                            }
                        }
                    }
                    }
                        
                
                Section("Choose a unit to convert") {
                    Picker("Choose a unit", selection: $outputUnit) {
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Section ("Result") {
                    HStack {
                        Text(result, format: .number)
                        Text(outputUnit)
                    }
                    
                }
            }
                
           
            .navigationTitle("Temperature converter")
        }
    }
}

#Preview {
    TemperatureView()
}
