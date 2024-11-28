//
//  Topbar.swift
//  ForecastFlow
//
//  Created by Tony Chen on 2/10/2024.
//

import SwiftUI

struct Topbar: View {
    @Binding var isSaveLocation: Bool
    @Binding var showSheet: Bool
    @Environment(\.dismiss) private var close
    @State var saveData: () -> Void = {}
    
    var cityName: String
    var date: String
    
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
            CircleButtonView(imageName: L10n.CurrentWeather.plusIcon)
                .tapAnimate {
                    saveData()
                    close()
                }
        } else {
            CircleButtonView(imageName: L10n.CurrentWeather.magnifyingGlassIcon)
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
                Text(cityName)
                    .font(.headline.bold())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.whiteColor)
            }
            .padding(.horizontal, -10)
            Text(date)
                .font(.body)
                .foregroundStyle(Color.whiteColor)
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    Topbar(isSaveLocation: .constant(false),
           showSheet: .constant(false),
           cityName: "Sydney", date: "Monday, Nov 11")
        .preferredColorScheme(.dark)
}
