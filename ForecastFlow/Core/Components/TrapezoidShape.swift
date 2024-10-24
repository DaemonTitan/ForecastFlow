//
//  TrapezoidShape.swift
//  ForecastFlow
//
//  Created by Tony Chen on 23/10/2024.
//

import SwiftUI

struct TrapezoidShape: View {
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint
    var point4: CGPoint
    var radius: CGFloat
    var color: LinearGradient?
    
    var body: some View {
        drawShape()
            .foregroundStyle(color ?? GradientBackgroundColours.instance.sunnyDay)
    }
    
    @ViewBuilder
    func drawShape() -> some View {
        Path { path in
            let midPoint = CGPoint(x: 0.5 * (point1.x + point2.x), y: 0.5 * (point1.y + point2.y))
            
            path.move(to: midPoint)
            path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
            path.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
            path.addArc(tangent1End: point4, tangent2End: point1, radius: radius)
            path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
            path.addLine(to: midPoint)
        }
    }
}

#Preview {
    TrapezoidShape(point1: CGPoint(x: 50, y: 170),
                   point2: CGPoint(x: 350, y: 170),
                   point3: CGPoint(x: 350, y: -30),
                   point4: CGPoint(x: 50, y: 50),
                   radius: 40,
                   color: GradientBackgroundColours.instance.sunnyDay)
}
