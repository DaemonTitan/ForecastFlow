//
//  XMarkButton.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) private var close
    @State var animateImage: Bool = false
    
    var body: some View {
        CircleButtonView(imageName: "xmark")
            .tapAnimate {
                close()
            }
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    XMarkButton()
}
