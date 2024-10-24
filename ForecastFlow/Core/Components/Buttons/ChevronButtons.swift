//
//  ArrowButtons.swift
//  ForecastFlow
//
//  Created by Tony Chen on 18/10/2024.
//

import SwiftUI

struct ChevronRightButton: View {
    var step: Int = 0
    var buttonAction: () -> Void
    @EnvironmentObject var locationManager: LocationManager
    @State private var animate: Bool = false
    
    var body: some View {
        Button(action: {
            buttonAction()
            animate.toggle()
            withAnimation(.spring(response: 0.3,
                                  dampingFraction: 0.2,
                                  blendDuration: 0.1)) {
                animate.toggle()
            }
        }, label: {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 30,
                bottomLeading: 30,
                bottomTrailing: 0,
                topTrailing: 0
            ))
            .foregroundStyle(Color.orangeColor)
            .frame(width: 100, height: 55)
            .overlay {
                if step == 3 && locationManager.userLocation != nil {
                    Text(L10n.Onboarding.getStart)
                        .font(.headline.bold())
                        .foregroundStyle(Color.whiteColor)
                } else {
                    Image(systemName: L10n.Onboarding.chevronRightIcon)
                        .font(.title3.bold())
                        .foregroundStyle(Color.whiteColor)
                }
            }
        })
        .scaleEffect(animate ? 1.3 : 1.0)
    }
}

struct ChevronLeftButton: View {
    var buttonAction: () -> Void
    @State private var animate: Bool = false
    
    var body: some View {
        Button(action: {
            buttonAction()
            animate.toggle()
            withAnimation(.spring(response: 0.3,
                                  dampingFraction: 0.2,
                                  blendDuration: 0.1)) {
                animate.toggle()
            }
        }, label: {
            UnevenRoundedRectangle(cornerRadii: .init(
                topLeading: 0,
                bottomLeading: 0,
                bottomTrailing: 30,
                topTrailing: 30
            ))
            .foregroundStyle(Color.orangeColor)
            .frame(width: 100, height: 55)
            .overlay {
                Image(systemName: L10n.Onboarding.chevronLeftIcon)
                    .font(.title3.bold())
                    .foregroundStyle(Color.whiteColor)
            }
        })
        .scaleEffect(animate ? 1.3 : 1.0)
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        ChevronRightButton(buttonAction: {})
        ChevronLeftButton(buttonAction: {})
    }
    .padding()
    //.preferredColorScheme(.dark)

}
