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
            Text("\(vm.currentWeatherData?.main?.temp ?? 0.0)")
            Text(vm.currentWeatherData?.name ?? "")
        }
        .padding()
        .onAppear {
            Task {
                //await vm.fetchCurrentWeatherData()
            }
        }
    }
}

#Preview {
    ContentView()
}
