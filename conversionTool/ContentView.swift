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
            VStack (alignment: .leading){
                NavigationLink{
                    TemperatureView()
                } label: {
                    Text("Temperature")
                }
                NavigationLink {
                    LengthView()
                } label: {
                    Text("Length")
                }
                NavigationLink {
                    TimeView()
                } label : {
                    Text("Time")
                }
                NavigationLink {
                    VolumeView()
                } label: {
                    Text("Volume")
                }
                Spacer()
            }
           
            .navigationTitle("Conversion tool")
        }
        
    }
}

#Preview {
    ContentView()
}
