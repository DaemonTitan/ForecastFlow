//
//  ContentView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 11/9/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.currentWeatherData?.main.temp ?? 0.0)")
            Text(vm.currentWeatherData?.name ?? "")
            
            List {
                ForEach(vm.forecastWeatherData, id: \.dt) { item in
                    Text("\(item.main.temp)")
                }
            }

        }
        .padding()
        .onAppear {
            Task {
                //await vm.fetchCurrentWeatherData()
                //await vm.fetchForecastWeatherData()
            }
        }
    }
}

#Preview {
    ContentView()
}
