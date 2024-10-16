//
//  ForecastWeatherDetailBox.swift
//  ForecastFlow
//
//  Created by Tony Chen on 9/10/2024.
//

import SwiftUI

struct ForecastWeatherDetailBox: View {
    var optionListName: String
    var date: String
    var image: String
    var time: String
    var temp: String
    var maxTemp: String
    var minTemp: String
    
    var body: some View {
        VStack {
            dateField
            weatherDetails
        }
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(width: 145, height: 150)
        )
        .padding(.all, 5)
    }
}

extension ForecastWeatherDetailBox {
    var dateField: some View {
        Text(date)
            .font(.subheadline)
            .foregroundStyle(.white)
            .transition(.slide)
    }
    
    var weatherDetails: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            HStack(spacing: 6) {
                VStack(alignment: .leading) {
                    Text(time)
                        .font(.subheadline)
                    Text("\(temp) \(L10n.celsius)")
                        .font(.title3.bold())
                }
                .foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 3) {
                    maxMinTemp(image: "\(L10n.ForecastWeather.arrowUpIcon)",
                               text: maxTemp,
                               fontSize: .footnote,
                               fontColor: Color.whiteColor)
                    maxMinTemp(image: "\(L10n.ForecastWeather.arrowDownIcon)",
                               text: minTemp,
                               fontSize: .footnote,
                               fontColor: Color.whiteColor)
                }

            }
        }
    }
    
    @ViewBuilder
    func maxMinTemp(image: String, text: String, fontSize: Font, fontColor: Color) -> some View {
            HStack() {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 10)
                Text("\(text) \(L10n.celsius)")
                    .font(fontSize)
            }
            .foregroundStyle(.white)
    }
    
    
    
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    ForecastWeatherDetailBox(optionListName: "Today", date: "Today", image: "01d", time: "10 PM", temp: "20", maxTemp: "20", minTemp: "9")
        .preferredColorScheme(.dark)
        .padding()
       
}
