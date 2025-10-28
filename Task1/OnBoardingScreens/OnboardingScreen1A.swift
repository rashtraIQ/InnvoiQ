//
//  OnboardingScreen1A.swift
//  Task1
//
//  Created by Rashtra Humane on 22/09/25.
//

class BusinessInfo: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var location: String = "India"
}

import SwiftUI

struct OnboardingScreen1A: View {
    @ObservedObject var businessInfo: BusinessInfo
    @FocusState private var isEmailFieldFocused: Bool
    @State private var navigateNext: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(spacing: 20) {
                    ProgressBar(currentStep: 1)

                    VStack(alignment: .leading, spacing: 25) {
                        Text("Is this your business name?")
                            .font(.system(size: 21.52, weight: .bold))
                            .foregroundStyle(Color(hex: "#000000"))

                        Text("This helps us personalize your experience")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(Color(hex: "#4B5563"))

                        VStack(alignment: .leading, spacing: 25) {
                            TextField("Crewnox", text: $businessInfo.name)
                                .focused($isEmailFieldFocused)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 7.36).fill(Color.white))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 7.36)
                                        .stroke(isEmailFieldFocused ? Color.blue.opacity(0.7) : Color(hex: "E5E7EB"),
                                                lineWidth: isEmailFieldFocused ? 2 : 0.96)
                                )
                                .frame(width: 343.14, height: 42.76)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)

                            NavigationLink(destination: OnboardingScreen2(businessInfo: businessInfo), isActive: $navigateNext) {
                                Button {
                                    navigateNext = true
                                } label: {
                                    RoundedRectangle(cornerRadius: 7.36)
                                        .fill(businessInfo.name.isEmpty ? Color(hex: "#B3D4FF") : Color(hex: "#528EFE"))
                                        .frame(width: 343.14, height: 51.5)
                                        .overlay {
                                            HStack {
                                                Text("Continue")
                                                    .font(.system(size: 13.79, weight: .semibold))
                                                    .foregroundStyle(Color.white)

                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(Color.white)
                                            }
                                        }
                                }
                                .disabled(businessInfo.name.isEmpty)
                            }
                        }
                    }
                    .padding(.leading, 12)

                    Spacer()
                }

                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#79ADCC"), Color(hex: "#D0AD9D")]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    ))
                    .frame(height: UIScreen.main.bounds.height * 0.42)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea(edges: .bottom)

                Rectangle()
                    .fill(Color.white)
                    .frame(width: 340.57, height: 325)
                    .overlay {
                        VStack {
                            HStack {
                                Circle()
                                    .fill(Color(hex: "D9D9D9"))
                                    .frame(width: 46.87, height: 46.87)
                                    .overlay {
                                        if businessInfo.name.isEmpty {
                                            Text("Add your logo")
                                                .font(.system(size: 7.21))
                                                .foregroundStyle(Color(hex: "0A2540"))
                                                .multilineTextAlignment(.center)
                                        } else {
                                            Text(String(businessInfo.name.prefix(1)).uppercased())
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundStyle(Color(hex: "0A2540"))
                                        }
                                    }

                                Spacer()

                                VStack(alignment: .trailing){
                                    HStack(alignment: .top,spacing: 0) {
                                        Spacer()
                                        Text("INVOICE")
                                            .font(.system(size: 12.02, weight: .bold))
                                            .foregroundStyle(Color(hex:"0A2540"))
                                       
                                        Rectangle().frame(width:14,height: 9.62)
                                    }
                                    VStack(alignment: .trailing) {
                                            Text(businessInfo.name.isEmpty ? "Crenox" : businessInfo.name)
                                                .font(.system(size: 7.21))
                                                .foregroundStyle(Color(hex:"0A2540"))

                                            Text("cnoxexample.com")
                                                .font(.system(size: 7.21))
                                                .foregroundStyle(Color(hex:"0A2540"))

                                            Text("India")
                                                .font(.system(size: 7.21))
                                                .foregroundStyle(Color(hex:"0A2540"))
                                        
                                    }
                                    .padding(.trailing,15)
                                }
                            }
                            .padding(.leading,12)
                            .padding(.top,25)

                            Spacer()
                        }
                    }
                    .ignoresSafeArea(edges: .bottom)
                    
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    OnboardingScreen1A(businessInfo: BusinessInfo())
}
