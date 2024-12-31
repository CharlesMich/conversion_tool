//
//  ContentView.swift
//  conversionTool
//
//  Created by Charles Michael on 12/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink{
                TemperatureView()
            } label: {
                Text("Temperature")
            }
            .navigationTitle("Conversion tool")
        }
        
    }
}

#Preview {
    ContentView()
}
