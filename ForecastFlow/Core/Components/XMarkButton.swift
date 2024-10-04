//
//  XMarkButton.swift
//  ForecastFlow
//
//  Created by Tony Chen on 1/10/2024.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) private var close
    
    var body: some View {
        CircleButtonView(imageName: "xmark")
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    XMarkButton()
}
