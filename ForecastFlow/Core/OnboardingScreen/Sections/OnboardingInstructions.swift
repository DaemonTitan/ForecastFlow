//
//  OnboardingInstructions.swift
//  ForecastFlow
//
//  Created by Tony Chen on 18/10/2024.
//

import SwiftUI

struct OnboardingInstructions: View {
    
    var onboardingTitle: String = ""
    var onboardingBody: String = ""
    
    var body: some View {
        VStack {
            Text(onboardingTitle)
                .font(.title.bold())
                .kerning(1.0)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
            Text(onboardingBody)
                .font(.headline)
                .kerning(1.0)
                .fixedSize(horizontal: false, vertical: true)
                .frame(height: 100)
                .padding(.horizontal, 20)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
        }
        .offset(y: -100)
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    OnboardingInstructions(onboardingTitle: L10n.Onboarding.Step1.title,
                           onboardingBody: L10n.Onboarding.Step1.body)
}
