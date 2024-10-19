//
//  OnboardingView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 18/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    var totalSteps: Int = 3
    @AppStorage("CurrentStep") var currentStep = 1
    @StateObject var locationManger = LocationManager()
    
    var body: some View {
//        if currentStep > totalSteps {
//            HomeView()
//        } else {
//            onboardingView
//        }
        
        onboardingView
    }
}

extension OnboardingView {
    
    var onboardingView: some View {
        VStack {
            onboardingDetails()
            PageSteps()
            
            HStack {
                backwardbuttons()
                Spacer()
                forwardButtons()
            }
        }
    }
    
    @ViewBuilder
    func backwardbuttons() -> some View {
        if currentStep > 1 {
            ChevronLeftButton() {
                currentStep -= 1
            }
        }
    }
    
    @ViewBuilder
    func forwardButtons() -> some View {
        ChevronRightButton(step: currentStep) {
            if currentStep <= totalSteps {
                if currentStep == 3 {
                    locationManger.requestLocation()
                } else {
                    currentStep += 1
                }
            } else {
                currentStep = 1
            }
        }
    }
    
    @ViewBuilder 
    func onboardingDetails() -> some View {
        switch currentStep {
        case 1:
            VStack {
                ImageBox(lottieFileName: "", colour: Color.darkPurple)
                OnboardingInstructions(onboardingTitle: L10n.Onboarding.Step1.title,
                                       onboardingBody: L10n.Onboarding.Step1.body)
            }
        case 2:
            VStack {
                ImageBox(lottieFileName: "LocationLottie", colour: Color.pinkColor)
                OnboardingInstructions(onboardingTitle: L10n.Onboarding.Step2.title,
                                       onboardingBody: L10n.Onboarding.Step2.body)
            }
        case 3:
            VStack {
                ImageBox(lottieFileName: "TravelLottie", colour: Color.orangeColor)
                OnboardingInstructions(onboardingTitle: L10n.Onboarding.Step3.title,
                                       onboardingBody: L10n.Onboarding.Step3.body)
            }
        default:
            VStack {
                ImageBox(lottieFileName: "LocationLottie", colour: Color.darkPurple)
                OnboardingInstructions(onboardingTitle: L10n.Onboarding.Step1.title,
                                       onboardingBody: L10n.Onboarding.Step1.body)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
