//
//  HomeView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var homeVM: HomeViewModel
    //@EnvironmentObject private var locationServices: LocationManager
    @State var isSaveLocation: Bool = false
    
    var body: some View {
        weatherDetailView
        
        
//        Group {
//            if locationServices.userLocation == nil {
//                OnboardingView()
//            } else {
//                weatherDetailView
//                    .onAppear {
//                        Task {
//                            //await homeVM.fetchCurrentWeatherData()
//                        }
//                    }
//            }
//        }
    }
}

extension HomeView {
    var weatherDetailView: some View {
        VStack {
            Topbar(isSaveLocation: $isSaveLocation)
            ScrollView {
                CurrentWeatherAndTemperature()
                CurrentWeatherDetails()
                ForecastSegment()
            }
        }
        .background(homeVM.backgroundColour.ignoresSafeArea())
    }
}

#Preview {
    HomeView()
        //.preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
        .environmentObject(WeatherMokeData.instance.locationServices)
}
