////
////  OnboardingScreen1.swift
////  Task1
////
////  Created by Rashtra Humane on 22/09/25.
////
//
//import SwiftUI
//
//struct OnboardingScreen1: View {
//    @State private var email1: String = ""
//    var body: some View {
//        VStack(spacing: 20){
//            HStack(spacing:0){
//                Text("Invoi")
//                    .font(.system(size: 36.3, weight: .bold))
//                    .foregroundStyle(Color(hex: "#528EFE"))
//                Text("Q")
//                    .font(.system(size: 36.3, weight: .bold))
//                    .foregroundStyle(Color(hex: "#F9AE86"))
//            }
//            
//            Text("Is this your buisness name?")
//                .font(.system(size: 21.52, weight: .bold))
//                .foregroundStyle(Color(hex: "#000000"))
//                .lineSpacing(9.5)
//            
//            Text("This helps us personalize your experience")
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundStyle(Color(hex: "#4B5563"))
//                .lineSpacing(9)
//            TextField("Enter Email", text: $email1)
//                .padding(.horizontal, 12)
//                .padding(.vertical, 10)
//                .background(
//                    RoundedRectangle(cornerRadius: 7.36)
//                        .stroke(Color(hex: "E5E7EB"), lineWidth: 0.96)
//                )
//                .frame(width: 343.14, height: 42.76)
//                .textInputAutocapitalization(.never)
//                .keyboardType(.emailAddress)
//                .autocorrectionDisabled(true)
//            
//            Button {
//               
//            } label: {
//                RoundedRectangle(cornerRadius: 7.36)
//                    .fill(
//                        (email1.isEmpty)
//                        ? Color(hex: "#B3D4FF")
//                        : Color(hex: "#528EFE")
//                    )
//                    .frame(width: 343.14, height: 51.5)
//                    .overlay {
//                        HStack {
//                            Text("Continue")
//                                .font(.system(size: 13.79, weight: .semibold))
//                                .foregroundStyle(Color.white)
//                                .lineSpacing(8.31)
//                            
//                            Image(systemName: "chevron.right")
//                                .foregroundStyle(Color.white)
//                        }
//                    }
//            }
//            .disabled(email1.isEmpty)
//            
//            Rectangle()
//                .fill(
//                    LinearGradient(
//                        gradient: Gradient(stops: [
//                            .init(color: Color(hex: "#79ADCC"), location: 0.0),
//                            
//                            
//                            .init(color: Color(hex: "#D0AD9D"), location: 0.99),
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottomTrailing
//                    )
//                )
//                .frame(height: UIScreen.main.bounds.height * 0.37)
//                .frame(maxWidth: .infinity)
//            
//            Rectangle()
//                .fill(Color(hex: "#F3FFFF"))
//                .frame(width: 343.14,height: 350)
//                .overlay {
//                    HStack{
//                        Circle()
//                            .fill(Color(hex: "D9D9D9"))
//                            .frame(width: 46.87,height: 46.87)
//                            .overlay{
//                                Text("Add your logo")
//                                    .font(.system(size: 7.21, weight: .regular))
//                                    .foregroundStyle(Color(hex: "0A2540"))
//                                    .multilineTextAlignment(.center)
//                                    
//                            }
//                        Spacer()
//                        
//                    }
//                    
//                }
//                
//        }
//        
//    }
//}
//
//#Preview {
//    OnboardingScreen1()
//}
//
//  OnboardingScreen1.swift
//  Task1
//
//  Created by Rashtra Humane on 22/09/25.
//

import SwiftUI

struct OnboardingScreen1: View {
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
                                    Text("Add your logo")
                                        .font(.system(size: 7.21, weight: .regular))
                                        .foregroundStyle(Color(hex: "0A2540"))
                                        .multilineTextAlignment(.center)
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
                                        Text("Crenox") // placeholder if nothing typed yet
                                                   .font(.system(size: 7.21, weight: .regular))
                                                   .foregroundStyle(Color(hex:"0A2540"))
                                    
                                    
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

struct ProgressBar: View {
    var currentStep: Int // 1 to 3
    let totalSteps = 3
    
    var progress: CGFloat {
        CGFloat(currentStep) / CGFloat(totalSteps)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background bar
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 8)
                    .cornerRadius(4)
                
                // Progress fill
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geometry.size.width * progress,
                           height: 8)
                    .cornerRadius(4)
            }
        }
        .frame(height: 8) // lock height
        .padding()
        .animation(.easeInOut, value: currentStep)
    }
}


#Preview {
    OnboardingScreen1()
}
