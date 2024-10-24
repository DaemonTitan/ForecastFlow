//
//  ButtonTapAnimation.swift
//  ForecastFlow
//
//  Created by Tony Chen on 24/10/2024.
//

import Foundation
import SwiftUI

struct ButtonTapAnimation: ViewModifier {
    @State var animate: Bool = false
    var additionalAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 1.0 : 0.9)
            .frame(width: 50, height: 50)
            .onTapGesture {
                animate.toggle()
                  withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.1)) {
                      animate.toggle()
                      additionalAction?()
                  }
              }
    }
}
