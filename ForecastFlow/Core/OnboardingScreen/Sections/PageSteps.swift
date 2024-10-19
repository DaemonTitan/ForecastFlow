//
//  PageSteps.swift
//  ForecastFlow
//
//  Created by Tony Chen on 18/10/2024.
//

import SwiftUI

struct PageSteps: View {
    @AppStorage("CurrentStep") var currentStep = 1
    
    var body: some View {
        HStack {
            if currentStep == 1 {
                Color.greenColor.frame(height: 2)
                Color.grayColor.frame(height: 2)
                Color.grayColor.frame(height: 2)
            } else if currentStep == 2 {
                Color.greenColor.frame(height: 2)
                Color.greenColor.frame(height: 2)
                Color.grayColor.frame(height: 2)
            } else if currentStep == 3 {
                Color.greenColor.frame(height: 2)
                Color.greenColor.frame(height: 2)
                Color.greenColor.frame(height: 2)
            }
        }
        .padding(.horizontal, 80)
        .offset(y: -100)
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    PageSteps()
        .preferredColorScheme(.dark)
        .padding()
    
}
