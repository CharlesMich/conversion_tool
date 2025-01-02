//
//  LengthView.swift
//  conversionTool
//
//  Created by Charles Michael on 12/31/24.
//

import SwiftUI

struct LengthView: View {
    
    @State private var length = 0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var convertToMillimeters: Double {
        if inputUnit == "meters" {
            return Double(length) * 1000
        }
        if inputUnit == "kilometers" {
            return Double(length) * 1000000
        }
        if inputUnit == "feet" {
            return Double(length) * 304.8
        }
        if inputUnit == "yards" {
            return Double(length) * 914.4
        }
        if inputUnit == "miles" {
            return Double(length) * 1609344
        }
        return 0
    }
    
    var resultLength: Double {
       
            if outputUnit == "meters"{
                return convertToMillimeters / 1000
            }
            if outputUnit == "kilometers"{
                return convertToMillimeters / 1000000
            }
            if outputUnit == "feet"{
                return convertToMillimeters / 304.8
            }
            if outputUnit == "yards"{
                return convertToMillimeters / 914.4
            }
            if outputUnit == "miles"{
                return convertToMillimeters / 1609344
            }
        return 0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                
                Section ("Enter the length and unit") {
                    HStack{
                        TextField("Length", value: $length, format: .number)
                        Picker("", selection: $inputUnit) {
                            ForEach(units, id:\.self){
                                Text($0)
                            }
                        }
                    }
                }
                
                
                Section("Pick output unit"){
                    Picker("", selection: $outputUnit){
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section("Result") {
                    Text(resultLength, format: .number)
                }
            }
            .navigationTitle("Length Convertor")
        }
    }
}

#Preview {
    LengthView()
}
