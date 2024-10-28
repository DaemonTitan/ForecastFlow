//
//  LocationSearchView.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct LocationSearchView: View {
    @StateObject var locationSearchManager = LocationSearchManager()
    @StateObject var locationSearchVM = LocationSearchViewModel()
    
    var body: some View {
        NavigationStack {
            List(locationSearchManager.searchResult) { cityName in
                HStack {
                    VStack(alignment: .leading) {
                        Text(cityName.title)
                        Text(cityName.subtitle)
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    
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
            .searchable(text: $locationSearchVM.queryText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: L10n.LocationSearch.searchBarText)
            .onChange(of: locationSearchVM.debounceText) { text in
                if !locationSearchVM.debounceText.isEmpty {
                    locationSearchManager.searchCity(for: text)
                } else {
                    locationSearchManager.searchResult = []
                }
            }
        }
    }
}

#Preview {
    LocationSearchView()
}
