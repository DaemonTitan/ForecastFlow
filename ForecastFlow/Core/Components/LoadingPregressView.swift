//
//  LoadingPregressView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct LoadingPregressView: View {
    var body: some View {
        VStack {
            Text(L10n.LoadingProgress.loadingWeather)
                .bold()
                .padding(.vertical, 20)
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.blue)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingPregressView()
}
