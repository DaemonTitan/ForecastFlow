//
//  AlertManager.swift
//  ForecastFlow
//
//  Created by Tony Chen on 21/10/2024.
//

import Foundation
import UIKit
import SwiftUI

class AlertManager: ObservableObject {
    static var instance = AlertManager()
    private let error: LocationErrors = .locationNotDeterminedError
    
    func openSettings() {
        if let url = URL.init(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @ViewBuilder func buttonAlert() -> some View {
        switch error {
        case .locationNotDeterminedError:
            Button(role: .cancel, action: {
                self.openSettings()
            }, label: {
                Text(L10n.Alert.Button.settings)
            })
            
            Button(action: {}, label: {
                Text(L10n.Alert.Button.dismiss)
            })
            
        case .locationDeniedError:
            Button(action: {}, label: {
                Text(L10n.Alert.Button.dismiss)
            })
        
        case .locationRestrictedError:
            Button(action: {}, label: {
                Text(L10n.Alert.Button.dismiss)
            })
        }
    }
}

extension View {
    
    func showLocationErrorAlert(_ isPresent: Binding<Bool>, error: LocationErrors) -> some View {
        self.alert(isPresented: isPresent, error: error) { error in
            AlertManager.instance.buttonAlert()
        } message: { error in
            Text(error.failureReason)
        }
    }
    
    

}
