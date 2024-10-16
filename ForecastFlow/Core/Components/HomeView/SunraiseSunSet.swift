//
//  SunraiseSunSet.swift
//  ForecastFlow
//
//  Created by Tony Chen on 5/10/2024.
//

import SwiftUI

struct SunraiseSunSet: View {
    var image: String
    var time: String
    var name: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .font(.title3)
                .foregroundStyle(.white)
            VStack {
                Text(time)
                    .font(.system(size: 15).bold())
                    .kerning(1)
                    .foregroundStyle(.white)
                Text(name)
                    .font(.footnote)
                    .foregroundStyle(.white)
            }
        }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    SunraiseSunSet(image: "sunrise", time: "06:00 am", name: "Sun raise")
        .preferredColorScheme(.dark)
        .padding()
}
