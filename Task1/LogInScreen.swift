//
//  LogInScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 17/09/25.
//

import SwiftUI
struct LogInScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signUpTapped: Bool = false
    
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
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(spacing: 40){
                            Text("Log In")
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
                            
                            Button {
                                signUpTapped.toggle()
                            } label: {
                                if(signUpTapped) {
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
                                else {
                                    Text("Sign Up")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(Color(hex: "37383B"))
                                        .lineSpacing(22)
                                }
                            }
                        }
                       
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Login if your are already a user")
                                .font(.system(size: 16.55, weight: .regular))
                                .foregroundStyle(Color(hex: "#37383B"))
                                .lineSpacing(16.5)
                            
                            Text("Username")
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
                            
                            Button {
                                
                            } label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 16.55, weight: .regular))
                                    .foregroundStyle(Color(hex: "#37383B"))
                                    .lineSpacing(16.5)
                            }
                            
                            Button {
                               
                            } label: {
                                RoundedRectangle(cornerRadius: 7.36)
                                    .fill(
                                        (email.isEmpty || password.isEmpty)
                                        ? Color(hex: "#B3D4FF")
                                        : Color(hex: "#528EFE")
                                    )
                                    .frame(width: 343.14, height: 51.5)
                                    .overlay {
                                        HStack {
                                            Text("Log In")
                                                .font(.system(size: 13.79, weight: .semibold))
                                                .foregroundStyle(Color.white)
                                                .lineSpacing(8.31)
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(Color.white)
                                        }
                                    }
                            }
                            .disabled(email.isEmpty || password.isEmpty)
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
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}


#Preview {
    LogInScreen()
}
