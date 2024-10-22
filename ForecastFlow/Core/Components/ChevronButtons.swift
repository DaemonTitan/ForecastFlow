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
    
    var body: some View {
        Button(action: {
            buttonAction()
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
                if step == 3 {
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
    }
}

struct ChevronLeftButton: View {
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
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
