//
//  CircleButtonView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import SwiftUI

struct CircleButtonView: View {
    let imageName: String
    
    var body: some View {
        Image(systemName : imageName)
            .font(.title2.weight(.bold))
            .foregroundStyle(Color.blackColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.whiteColor)
            )
            .shadow(color: Color.black.opacity(0.5),radius: 10)
            .padding()
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(imageName: "magnifyingglass")
}
