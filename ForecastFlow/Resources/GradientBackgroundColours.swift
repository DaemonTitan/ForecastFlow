//
//  GradientBackgroundColours.swift
//  ForecastFlow
//
//  Created by Tony Chen on 30/9/2024.
//

import Foundation
import SwiftUI

class GradientBackgroundColours {
    
    static let instance = GradientBackgroundColours()
    
    let sunnyDay = LinearGradient(
        gradient: Gradient(colors: [Color.lightBlueColor,
                                    Color.blueColor]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    let rainyDay = LinearGradient(
        gradient: Gradient(colors: [Color.darkGrayColor,
                                    Color.lightGrayColor]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    
    let darkNight = LinearGradient(
        gradient: Gradient(colors: [Color.darkBlueColor,
                                    Color.royalBlueColor]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    
    let sunraise = LinearGradient(stops: [
        Gradient.Stop(color: Color.denimColor, location: 0.1),
        Gradient.Stop(color: Color.orangeColor, location: 0.8),
        Gradient.Stop(color: Color.yellowColor, location: 1.0)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    
    let sunset = LinearGradient(
        gradient: Gradient(colors: [Color.yellowColor,
                                    Color.orangeColor,
                                    Color.darkPinkColor,
                                    Color.twilightPurpleColor]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}
