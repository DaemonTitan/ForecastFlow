//
//  LocationSearchView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct LocationSearchView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1...100, id: \.self) { item in
                    Text("\(item)")
                }
            }
            .background(Color.fogGrayColor.ignoresSafeArea())
            .listStyle(.plain)
            .navigationTitle(L10n.LocationSearch.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    LocationSearchView()
}
