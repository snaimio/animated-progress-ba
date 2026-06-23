//
//  ContentView.swift
//  AnimatedProgressBar2026
//
//  Created by Douglas Jasper on 2026-06-23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Animated Progress Bar")
                .font(.title2.bold())
            
            ProgressBar(progress: progress, barHeight: 25, barColor: .green)
                .frame(height: 25)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button("Reset") {
                    withAnimation {
                        progress = 0.0
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Increase") {
                    withAnimation {
                        progress = min(progress + 0.1, 1.0)
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Random") {
                    withAnimation {
                        progress = Double.random(in: 0...1)
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            ProgressBar(progress: progress, barHeight: 25, barColor: .green)
                .frame(height: 25)
                .padding(.horizontal)
                //.onAppear {
                //    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                //        progress = Double.random(in: 0...1)
                //    }
                //}
            
            // Circular Progress Bar
            CircularProgressBar(progress: progress)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
