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
        Topbar(isSaveLocation: $isSaveLocation,
               locationName: "\(homeVM.currentWeatherData?.name ?? "")",
               currentDate: homeVM.displayCurrentDate())
        Spacer()
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
        .environmentObject(CurrentWeatherMokeData.instance.homeVM)
}
