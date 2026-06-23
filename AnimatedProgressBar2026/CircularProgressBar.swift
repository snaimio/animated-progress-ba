//
//  CircularProgressBar.swift
//  AnimatedProgressBar2026
//
//  Created by Douglas Jasper on 2026-06-23.
//

import SwiftUI

struct CircularProgressBar: View {
    var progress: Double   // 0.0 - 1.0
    
    var body: some View {
        ZStack {
            
            // Background Circle
            Circle()
                .stroke(
                    Color.gray.opacity(0.3),
                    lineWidth: 15
                )
            
            // Progress Circle
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        colors: [.blue, .purple, .pink],
                        center: .center
                    ),
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.8), value: progress)
            
            // Percentage Label
            Text("\(Int(progress * 100))%")
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(width: 180, height: 180)
    }
}

#Preview {
    VStack(spacing: 20) {
        CircularProgressBar(progress: 0.25)
        CircularProgressBar(progress: 0.50)
        CircularProgressBar(progress: 0.75)
        CircularProgressBar(progress: 1.00)
    }
    .padding()
}
