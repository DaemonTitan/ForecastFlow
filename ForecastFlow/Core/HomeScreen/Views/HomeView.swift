//
//  HomeView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    
    @State var isSaveLocation: Bool = false
    
    var body: some View {
        VStack {
            Topbar(isSaveLocation: $isSaveLocation)
            CurrentWeatherAndTemperature()
            CurrentWeatherDetails()
            ForecastSegment()
            Spacer()
        }
        .onAppear {
            Task {
                //await homeVM.fetchCurrentWeatherData()
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
