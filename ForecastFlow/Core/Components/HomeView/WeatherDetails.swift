//
//  WeatherDetails.swift
//  ForecastFlow
//
//  Created by Tony Chen on 5/10/2024.
//

import SwiftUI

struct WeatherDetails: View {
    var image: String
    var data: String
    var name: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: image)
                .foregroundStyle(Color.whiteColor)
            Text(data)
                .font(.system(size: 16).bold())
                .kerning(1)
                .foregroundStyle(Color.whiteColor)
            Text(name)
                .font(.footnote)
                .foregroundStyle(Color.whiteColor)
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    WeatherDetails(image: "thermometer.sun",
                   data: "20 / 10",
                   name: "Max/Min")
    .preferredColorScheme(.dark)
    .padding()
}
