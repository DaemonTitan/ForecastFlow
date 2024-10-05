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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                //ContentView()
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
