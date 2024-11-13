//
//  ForecastSegment.swift
//  ForecastFlow
//
//  Created by Tony Chen on 9/10/2024.
//

import SwiftUI

struct ForecastSegment: View {
    
    @Namespace var days
    @EnvironmentObject var homeVM: HomeViewModel
    @State var daysOption = HomeViewModel.OptionList.today
    @Binding var isSaveLocation: Bool
    
    var forcastList: [ForecastList]
    
    var body: some View {
        VStack {
            dailyOption
            weatherScrollView
        }
        .padding(.vertical, 40)
    }
}

extension ForecastSegment {
    var dailyOption: some View {
        HStack() {
            ForEach(HomeViewModel.OptionList.allCases) { item in
                ZStack {
                    Text(item.displayName)
                        .font(.headline)
                        .foregroundStyle(daysOption == item ? Color.yellowColor : Color.whiteColor)
                        .padding(.horizontal, 5)
                    
                    if daysOption == item {
                        Rectangle()
                            .fill(Color.yellowColor)
                            .offset(y: 17)
                            .frame(width: item.displayName == L10n.Day.tomorrow ? 80 : item.displayName == L10n.Day.next3Days ? 100 : 50, height: 2)
                            .matchedGeometryEffect(id: L10n.Day.optionList, in: days)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        daysOption = item
                    }
                }
            }
        }
        .offset(x: -30)
    }
    
    var weatherScrollView: some View {
        switch daysOption {
        case .today:
            scrollView(dateSegment: L10n.Day.today, dailyForecast: forcastList)
        case .tomorrow:
            scrollView(dateSegment: L10n.Day.tomorrow, dailyForecast: forcastList)
        case .next3Days:
            scrollView(dateSegment: L10n.Day.next3Days, dailyForecast: forcastList)
        }
    }
    
    @ViewBuilder
    func scrollView(dateSegment: String, dailyForecast: [ForecastList]) -> some View{
            ScrollView(.horizontal) {
                HStack {
                    ForEach(dailyForecast, id: \.dt) { item in
                        ForecastWeatherDetailBox(optionListName: dateSegment,
                                                 date: item.dateForecasted,
                                                 image: item.weather[0].icon,
                                                 time: item.timeForecasted,
                                                 temp: "\(item.main.temp.doubleToString())",
                                                 maxTemp: "\(item.main.tempMax.doubleToString())",
                                                 minTemp: "\(item.main.tempMin.doubleToString())")
                        .padding()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .onAppear {
                if !isSaveLocation {
                    Task {
                        await homeVM.forecastDateFilter(dateSegment: dateSegment)
                        //await homeVM.fetchForecastWeatherData()
                    }
                } else {
                    Task {
                        
                    }
                }
                

            }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    ForecastSegment(isSaveLocation: .constant(false), forcastList: WeatherMokeData.instance.forecastWeather)
        .preferredColorScheme(.dark)
        .environmentObject(WeatherMokeData.instance.homeVM)
}
