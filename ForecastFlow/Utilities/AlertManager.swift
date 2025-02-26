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
    private let locationError: LocationErrors = .locationNotDeterminedError
    private let coreDataError: CoreDataErrors = .coreDataSaveError
    
    func openSettings() {
        if let url = URL.init(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @ViewBuilder func locationErrorAlertButton() -> some View {
        switch locationError {
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
