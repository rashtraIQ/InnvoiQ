//
//  ContentView.swift
//  Task1
//
//  Created by Rashtra Humane on 16/09/25.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State private var offsets: [CGFloat] = Array(repeating: 100, count: 6)
    @State private var opacities: [Double] = Array(repeating: 0.0, count: 6)
    @State private var navigateToLogin = false
    
    let brandName = Array("InoviQ")
    let blueColor = Color(hex: "#528EFE")
    let orangeColor = Color(hex: "#F9AE86")
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            HStack(spacing: 0) {
                ForEach(brandName.indices, id: \.self) { index in
                    Text(String(brandName[index]))
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(index <= 4 ? blueColor : orangeColor)
                        .offset(y: offsets[index])
                        .opacity(opacities[index])
                }
            }
        }
        .onAppear {
            animateCharacters()
        }
        .fullScreenCover(isPresented: $navigateToLogin) {
            LogInScreen()
        }
    }
    private func animateCharacters() {
        for index in brandName.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.12) {
                withAnimation(.easeOut(duration: 0.5)) {
                    offsets[index] = 0
                    opacities[index] = 1
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 + Double(brandName.count) * 0.12) {
            withAnimation {
                navigateToLogin = true
            }
        }
    }
}


#Preview {
    ContentView()
    
}
