//
//  SignUpScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 19/09/25.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing:10){
                HStack(spacing:0){
                    Text("Invoi")
                        .font(.system(size: 36.3, weight: .bold))
                        .foregroundStyle(Color(hex: "#528EFE"))
                    Text("Q")
                        .font(.system(size: 36.3, weight: .bold))
                        .foregroundStyle(Color(hex: "#F9AE86"))
                }
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(spacing: 40){
                            Text("Log In")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color(hex: "37383B"))
                                .lineSpacing(22)
                            
                            
                            Text("Sign Up")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color(hex: "#528EFE"))
                                .lineSpacing(22)
                                .overlay(
                                    Rectangle()
                                        .fill(Color(hex: "#528EFE"))
                                        .frame(height: 2.76)
                                        .offset(y: 10),
                                    alignment: .bottom
                                )
                        }
                        Text("Sign up & become a user")
                            .font(.system(size: 16.11, weight: .regular))
                            .foregroundStyle(Color(hex: "#37383B"))
                            .lineSpacing(16.08)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Email")
                                .font(.system(size: 16.55, weight: .regular))
                                .foregroundStyle(Color(hex: "#37383B"))
                                .lineSpacing(11.55)
                            
                            TextField("Enter Email", text: $email)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 7.36)
                                        .stroke(Color(hex: "2F2F2F"), lineWidth: 0.92)
                                )
                                .frame(width: 343.14, height: 42.76)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .autocorrectionDisabled(true)
                            
                            Text("Password")
                                .font(.system(size: 16.55, weight: .regular))
                                .foregroundStyle(Color(hex: "#37383B"))
                                .lineSpacing(11.55)
                            
                            SecureField("Enter Password", text: $password)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 7.36)
                                        .stroke(Color(hex: "2F2F2F"), lineWidth: 0.92)
                                )
                                .frame(width: 343.14, height: 42.76)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                            VStack(alignment: .leading, spacing: 10){
                                Text("Subscription Pack")
                                    .font(.system(size: 16.11, weight: .regular))
                                    .foregroundStyle(Color(hex: "#37383B"))
                                    .lineSpacing(11.29)
                                
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 7.36)
                                        .fill(
                                            Color(hex: "FFDA03")
                                        )
                                        .frame(width: 343.14,height: 50.12)
                                        .overlay {
                                            HStack{
                                                
                                                Image("paypal")
                                                    .resizable()
                                                    .frame(width: 89.51,height: 23.74)
                                                Text("Subscribe")
                                                    .font(.system(size: 13.43, weight: .medium))
                                                    .foregroundStyle(Color(hex: "000000"))
                                                    .lineSpacing(8.31)
                                            }
                                        }
                                }
                                
                            }
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 7.36)
                                    .fill(Color(hex: "#000000"))
                                    .frame(width: 343.14,height: 50.12)
                                    .overlay(
                                        HStack{
                                            Image(systemName: "creditcard")
                                                .foregroundStyle(Color.white)
                                            Text("Debit or Credit Card")
                                                .font(.system(size: 16.11, weight: .regular))
                                                .foregroundStyle(Color(hex: "FFFFFF"))
                                                .lineSpacing(8.31)
                                           
                                        }
                                            .padding(.leading, 12)
                                    )
                                
                            }
                            
                            
                            
                            
                        }
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                Spacer()
            }
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(hex: "#79ADCC"), location: 0.0),
                            .init(color: Color(hex: "#D5AE9A"), location: 0.51),
                            .init(color: Color(hex: "#F9AE86"), location: 0.72),
                            .init(color: Color(hex: "#F9AE86"), location: 0.78),
                        ]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: UIScreen.main.bounds.height * 0.27)
                .frame(maxWidth: .infinity)
            Image("Dashboard")
                .resizable()
                .frame(width: 343.14,height: 300)
                .clipped()
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

#Preview {
    SignUpScreen()
}
