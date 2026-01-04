//
//  OnboardingScreen4.swift
//  Task1
//
//  Created by Rashtra Humane on 15/10/25.
//

import SwiftUI

struct OnboardingScreen4: View {
    @ObservedObject var businessInfo: BusinessInfo
    @FocusState private var isEmailFieldFocused: Bool
    @State private var navigateNext: Bool = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 25) {
                    ProgressBar(currentStep: 3)

                    Text("Where is your business location?")
                        .font(.system(size: 21.52, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))

                    Text("This will help us pre-set settings as per your location")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color(hex: "#4B5563"))

                    VStack(spacing: 45) {
                        TextField("India", text: $businessInfo.location)
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
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)

                        NavigationLink(destination: OnboardingScreen3(businessInfo: businessInfo), isActive: $navigateNext) {
                            Button {
                                navigateNext = true   // trigger navigation
                            } label: {
                                RoundedRectangle(cornerRadius: 7.36)
                                    .fill(businessInfo.email.isEmpty ? Color(hex: "#B3D4FF") : Color(hex: "#528EFE"))
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
                            .disabled(businessInfo.email.isEmpty)
                        }
                    }

                    Spacer()
                }
                .padding(.leading, 20)

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
                                        Text(businessInfo.name.isEmpty ? "C" : String(businessInfo.name.prefix(1)).uppercased())
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundStyle(Color(hex: "0A2540"))
                                    }

                                Spacer()

                                VStack(alignment: .trailing) {
                                    HStack(alignment: .top,spacing: 0) {
                                        Spacer()
                                        Text("INVOICE")
                                            .font(.system(size: 12.02, weight: .bold))
                                            .foregroundStyle(Color(hex:"0A2540"))
                                        Rectangle().frame(width: 18, height: 9.62)
                                    }

                                    VStack(alignment: .trailing) {
                                        Text(businessInfo.name.isEmpty ? "Crenox" : businessInfo.name)
                                            .font(.system(size: 7.21))
                                            .foregroundStyle(Color(hex: "0A2540"))

                                        Text(businessInfo.email.isEmpty ? "crewnox@gmail.com" : businessInfo.email)
                                            .font(.system(size: 7.21))
                                            .foregroundStyle(Color(hex: "0A2540"))

                                        Text("India")
                                            .font(.system(size: 7.21))
                                            .foregroundStyle(Color(hex: "0A2540"))
                                    }
                                    .padding(.trailing,15)
                                }
                            }
                            .padding(.leading, 12)
                            .padding(.top, 25)
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
    OnboardingScreen4(businessInfo: BusinessInfo())
}

