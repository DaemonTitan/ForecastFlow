//
//  ForecastFlowApp.swift
//  ForecastFlow
//
//  Created by Tony Chen on 11/9/2024.
//

import SwiftUI

@main
struct ForecastFlowApp: App {
    @StateObject private var vm = HomeViewModel()
    @StateObject private var locationServices = LocationManager()
//    @StateObject private var locationSearchVM = LocationSearchViewModel()
//    @StateObject private var locationSearchManager = LocationSearchManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                //ContentView()
                //HomeView()
                OnboardingView()
            }
            .environmentObject(vm)
            .environmentObject(locationServices)
//            .environmentObject(locationSearchVM)
//            .environmentObject(locationSearchManager)
        }
    }
}
