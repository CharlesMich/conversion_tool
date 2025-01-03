//
//  TimeView.swift
//  conversionTool
//
//  Created by Charles Michael on 12/31/24.
//

import SwiftUI

struct TimeView: View {
    
    @State private var time = 0
    @State private var inputUnit = "seconds"
    @State private var outputUnit = "minutes"
    
    
    var units = [ "seconds", "minutes", "hours", "days"]
    
    var convertToSeconds: Double {
        if inputUnit == "seconds" {
            return Double(time)
        }
            if inputUnit == "minutes"{
                return Double(time) * 60
            }
        if inputUnit == "hours"{
            return Double(time) * 3600
        }
        if inputUnit == "days"{
            return Double(time) * 86400
        }
        return 0
        }
    
    var resultTime: Double {
        if outputUnit == "seconds"{
            return convertToSeconds
        }
        if outputUnit == "minutes"{
            return convertToSeconds / 60
        }
        if outputUnit == "hours"{
            return convertToSeconds / 3600
        }
        if outputUnit == "days"{
            return convertToSeconds / 86400
        }
        
        return 0
    }
       
    var body: some View {
        NavigationStack {
            Form {
                Section("enter time and unit") {
                    HStack {
                        TextField("time", value: $time, format:.number)
                        Picker("", selection: $inputUnit){
                            ForEach(units, id:\.self){
                                Text($0)
                            }
                        }
                    }
                }
                
                Section("Pick a output unit") {
                    Picker("", selection: $outputUnit){
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result"){
                    Text(resultTime, format: .number)
                }
                
            }
            
            .navigationTitle("Time Convertor")
        }
        
    }
}

#Preview {
    TimeView()
}
