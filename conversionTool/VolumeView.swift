//
//  VolumeView.swift
//  conversionTool
//
//  Created by Charles Michael on 12/31/24.
//

import SwiftUI

struct VolumeView: View {
    @State private var inputUnit = "liters"
    @State private var outputUnit = "gallons"
    @State private var volume = 0
        
    let units = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var convertToMilliliters: Double {
        if inputUnit == "milliliters"{
            return Double(volume)
        }
        if inputUnit == "liters"{
            return Double(volume) * 1000
        }
        if inputUnit == "cups"{
            return Double(volume) * 236.6
        }
        if inputUnit == "pints"{
            return Double(volume) * 473.2
        }
        if inputUnit == "gallons"{
            return Double(volume) * 3785
        }
        return 0
    }
    
    var resultVolume: Double {
        if outputUnit == "milliliters" {
            return convertToMilliliters
        }
        if outputUnit == "liters" {
            return convertToMilliliters / 1000
        }
        if outputUnit == "cups" {
            return convertToMilliliters / 236.6
        }
        if outputUnit == "pints" {
            return convertToMilliliters / 473.2
        }
        if outputUnit == "gallons" {
            return convertToMilliliters / 3785
        }
        return 0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Enter a volume and unit"){
                    HStack {
                        TextField("Enter Volume", value: $volume, format: .number)
                        Picker("", selection: $inputUnit){
                            ForEach(units, id:\.self){
                                Text($0)
                            }
                        }
                    }
                }
                
                Section("Pick a output unit"){
                    Picker("", selection: $outputUnit){
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Text(resultVolume, format: .number)
                }
            }
            .navigationTitle("Volume Convertor")
        }
    }
}

#Preview {
    VolumeView()
}
