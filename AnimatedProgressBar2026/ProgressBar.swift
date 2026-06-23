//
//  ProgressBar.swift
//  AnimatedProgressBar2026
//
//  Created by Douglas Jasper on 2026-06-23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double  // Value from 0.0 to 1.0
    var barHeight: CGFloat = 20
    var cornerRadius: CGFloat = 10
    var barColor: Color = .blue
    var backgroundColor: Color = Color.gray.opacity(0.3)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(LinearGradient(
                        colors: [.white, .gray],
                        startPoint: .leading,
                        endPoint: .trailing
                                        ))
                
                // Foreground (Animated)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(LinearGradient(
                        colors: [.green, .mint],
                        startPoint: .leading,
                        endPoint: .trailing
                                        ))
                    .frame(width: geometry.size.width * CGFloat(progress))
                    .animation(.easeInOut(duration: 0.8), value: progress)
                
                // progress percentage label
                Text("\(Int(progress * 100))%")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 10)
            }
        }
        .frame(height: barHeight)
    }
}

#Preview {
    VStack(spacing: 20) {
        ProgressBar(progress: 0.0)
            .frame(height: 20)
            .padding(.horizontal)
            
        ProgressBar(progress: 0.5, barHeight: 25, barColor: .orange)
            .frame(height: 25)
            .padding(.horizontal)
        
        ProgressBar(progress: 1.0, barHeight: 30, barColor: .green)
            .frame(height: 30)
            .padding(.horizontal)
    }
    .padding()
    .previewDisplayName("ProgressBar Preview")
}
