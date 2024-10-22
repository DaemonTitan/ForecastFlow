//
//  ImageBox.swift
//  ForecastFlow
//
//  Created by Tony Chen on 18/10/2024.
//

import SwiftUI
import Lottie

struct ImageBox: View {
    var lottieFileName: String
    var colour: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(colour)
                .frame(height: 470)
                .frame(maxWidth: .infinity)
                .shadow(color: Color.grayColor, radius: 30, y: 15)
            
            LottieView(animation: .named(lottieFileName))
                .configure { lotttleAnimationView in
                    lotttleAnimationView.contentMode = .scaleAspectFit
                }
                .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                .frame(width: 250, height: 250)
                .offset(y: 40)
        }
        .offset(y: -80)
        .ignoresSafeArea()
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    ImageBox(lottieFileName: "TravelLottie", colour: Color.darkPurple)
        .padding()
}
