//
//  OnboardingScreen3.swift
//  Task1
//
//  Created by Rashtra Humane on 22/09/25.
//

import SwiftUI

struct OnboardingScreen3: View {
    @State private var selectedCountry: String = "India"
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading,spacing: 25) {
               
                
                ProgressBar(currentStep: 3)
                
                Text("Upload Your Buisness Logo")
                    .font(.system(size: 21.52, weight: .bold))
                    .foregroundStyle(Color(hex: "#000000"))
                    .lineSpacing(9.5)
                
                Text("Add a buisness logo here")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color(hex: "#4B5563"))
                    .lineSpacing(9)
                
                VStack(alignment: .leading,spacing: 45){
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(hex: "F9AE86"))
                            .frame(width: 203,height: 50)
                            .overlay {
                                HStack{
                                    Text("Upload File")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(Color(hex: "#3C3C3B"))
                                        .lineSpacing(4)
                                    
                                    Image(systemName: "arrow.up")
                                        .resizable()
                                        .frame(width:18,height: 18)
                                        .foregroundStyle(Color(hex: "#6A6A69"))
                                }
                                
                            }
                    }
                    

                   
                    
                    Button {
                        // Continue action
                    } label: {
                        RoundedRectangle(cornerRadius: 7.36)
                            .fill(
                                (selectedCountry.isEmpty)
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
                    .disabled(selectedCountry.isEmpty)
                }
                
                
                Spacer()
            }
            .padding(.leading,20)
            Rectangle()
                .fill(
                    Color(hex: "FFFFFF")
                )
                .frame(height: UIScreen.main.bounds.height * 0.42)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: .bottom)
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
                                    Text("C") // static avatar for India
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(Color(hex: "0A2540"))
                                }
                            Spacer()
                            
                            VStack{
                                HStack(spacing: 0){
                                    
                                    Rectangle()
                                        .frame(width:14,height: 9.62)
                                }
                                
                            }
                        }
                        .padding(.leading,12)
                        .padding(.top,25)
                        
                        
                        Spacer()
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    OnboardingScreen3()
}
