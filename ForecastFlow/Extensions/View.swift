//
//  View.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import Foundation
import SwiftUI

extension View {
    func genericCustomAlert<T: CustomErrorMessages & LocalizedError>(_ isPresent: Binding<Bool>, error: T) -> some View {
        self.alert(isPresented: isPresent, error: error) { error in
            AlertManager.instance.locationErrorAlertButton()
        } message: { error in
            Text(error.subtitle)
        }
    }
    
    func coreDataErrorAlert(_ isPresent: Binding<Bool>, error: CoreDataErrors) -> some View {
        self.alert(isPresented: isPresent, error: error) { error in
            Button(action: {}, label: {
                Text(L10n.Alert.Button.dismiss)
            })
        } message: { error in
            Text(error.subtitle)
        }
    }
    
    func tapAnimate(additionalAction: (() -> Void)? = nil) -> some View {
        self.modifier(ButtonTapAnimation(additionalAction: additionalAction))
    }
}
