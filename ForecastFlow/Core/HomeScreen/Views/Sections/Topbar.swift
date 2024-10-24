//
//  Topbar.swift
//  ForecastFlow
//
//  Created by Tony Chen on 2/10/2024.
//

import SwiftUI

struct Topbar: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    @Binding var isSaveLocation: Bool
    @Binding var showSheet: Bool
    
    var body: some View {
        HStack {
            leftCircleButton()
            Spacer()
            locationAndDate
            Spacer()
            rightCircleButton()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func leftCircleButton() -> some View {
        if isSaveLocation {
            CircleButtonView(imageName: "plus")
        } else {
            CircleButtonView(imageName: "magnifyingglass")
                .tapAnimate {
                    showSheet.toggle()
                }
                .fullScreenCover(isPresented: $showSheet, content: LocationSearchView.init)
        }
    }
    
    @ViewBuilder
    private func rightCircleButton() -> some View {
        if isSaveLocation {
            XMarkButton()
        } else {
            CircleButtonView(imageName: "slider.horizontal.3")
                .tapAnimate()
        }
    }
}

extension Topbar {
    private var locationAndDate: some View {
        VStack(alignment: .center) {
            HStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Text("\(homeVM.currentWeatherData?.name ?? "")")
                    .font(.headline.bold())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.whiteColor)
            }
            .padding(.horizontal, -10)
            Text(homeVM.displayCurrentDate())
                .font(.body)
                .foregroundStyle(Color.whiteColor)
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    Topbar(isSaveLocation: .constant(false), showSheet: .constant(false))
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
