//
//  OnboardingScreen1A.swift
//  Task1
//
//  Created by Rashtra Humane on 22/09/25.
//

import SwiftUI

struct OnboardingScreen1A: View {
    @State private var email1: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 20) {
                HStack(spacing:0){
                    Text("Invoi")
                        .font(.system(size: 36.3, weight: .bold))
                        .foregroundStyle(Color(hex: "#528EFE"))
                    Text("Q")
                        .font(.system(size: 36.3, weight: .bold))
                        .foregroundStyle(Color(hex: "#F9AE86"))
                }
                
                ProgressBar(currentStep: 1)
                
                Text("Is this your buisness name?")
                    .font(.system(size: 21.52, weight: .bold))
                    .foregroundStyle(Color(hex: "#000000"))
                    .lineSpacing(9.5)
                
                Text("This helps us personalize your experience")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color(hex: "#4B5563"))
                    .lineSpacing(9)
                
                TextField("Enter Email", text: $email1)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 7.36)
                            .stroke(Color(hex: "E5E7EB"), lineWidth: 0.96)
                    )
                    .frame(width: 343.14, height: 42.76)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 7.36)
                        .fill(
                            (email1.isEmpty)
                            ? Color(hex: "#B3D4FF")
                            : Color(hex: "#528EFE")
                        )
                        .frame(width: 343.14, height: 51.5)
                        .overlay {
                            HStack {
                                Text("Continue")
                                    .font(.system(size: 13.79, weight: .semibold))
                                    .foregroundStyle(Color.white)
                                    .lineSpacing(8.31)
                                
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.white)
                            }
                        }
                }
                .disabled(email1.isEmpty)
                
                Spacer() // pushes everything up so bottom elements stay fixed
            }
            
            // Gradient rectangle pinned at bottom
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(hex: "#79ADCC"), location: 0.0),
                            .init(color: Color(hex: "#D0AD9D"), location: 0.99),
                        ]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: UIScreen.main.bounds.height * 0.42)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .bottom)
            
            // Rectangle with circle ABOVE gradient
            Rectangle()
                .fill(Color(hex: "#FFFFFF"))
                .frame(width: 340.57, height: 325)
                .overlay {
                    VStack{
                        HStack {
                            Circle()
                                .fill(Color(hex: "D9D9D9"))
                                .frame(width: 46.87, height: 46.87)
                                .overlay {
                                    if email1.isEmpty {
                                        Text("Add your logo")
                                            .font(.system(size: 7.21, weight: .regular))
                                            .foregroundStyle(Color(hex: "0A2540"))
                                            .multilineTextAlignment(.center)
                                    } else {
                                        Text(String(email1.prefix(1)).uppercased())
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundStyle(Color(hex: "0A2540"))
                                    }
                                }
                            Spacer()
                            
                            VStack{
                                HStack(spacing: 0){
                                    Text("INVOICE")
                                        .font(.system(size: 12.02, weight: .bold))
                                        .foregroundStyle(Color(hex:"0A2540"))
                                    
                                    Rectangle()
                                        .frame(width:14,height: 9.62)
                                }
                                
                                VStack{
                                    if email1.isEmpty {
                                        Text("Crenox") // placeholder if nothing typed yet
                                            .font(.system(size: 7.21, weight: .regular))
                                            .foregroundStyle(Color(hex:"0A2540"))
                                    } else {
                                        Text(email1)
                                            .font(.system(size: 7.21, weight: .regular))
                                            .foregroundStyle(Color(hex:"0A2540"))
                                    }
                                    
                                    Text("cnoxexample.com")
                                        .font(.system(size: 7.21, weight: .regular))
                                        .foregroundStyle(Color(hex:"0A2540"))
                                    
                                    Text("India")
                                        .font(.system(size: 7.21, weight: .regular))
                                        .foregroundStyle(Color(hex:"0A2540"))
                                }
                            }
                        }
                        .padding(.leading,12)
                        
                        Rectangle()
                            .fill(Color(hex: "F1F1F1"))
                            .frame(width: 326.32,height: 30.05)
                        Rectangle()
                            .fill(Color(hex: "F1F1F1"))
                            .frame(width: 326.32,height: 119)
                        Rectangle()
                            .fill(Color(hex: "F1F1F1"))
                            .frame(width: 326.32,height: 30.05)
                    }
                    
                }
                .ignoresSafeArea(edges: .bottom)
            
        }.edgesIgnoringSafeArea(.bottom)
    }
    
}

#Preview {
    OnboardingScreen1A()
}
