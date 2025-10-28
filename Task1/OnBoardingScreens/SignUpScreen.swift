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
    @FocusState private var focusedField: Field?
    @StateObject private var businessInfo = BusinessInfo()
    
    enum Field {
        case email, password
    }
    
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    private var emailBorderColor: Color {
        if email.isEmpty { return Color(hex: "2F2F2F") }
        return isEmailValid ? Color.blue.opacity(0.9) : Color.red
    }
    
    private func borderWidth(for field: Field) -> CGFloat {
        (focusedField == field) ? 2 : 1.5
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(spacing:10) {
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
                                NavigationLink(destination: LogInScreen()) {
                                    Text("Log In")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(Color(hex: "37383B"))
                                        .lineSpacing(22)
                                }
                                
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
                                VStack(alignment: .leading){
                                    Text("Email")
                                        .font(.system(size: 16.55, weight: .regular))
                                        .foregroundStyle(Color(hex: "#37383B"))
                                    
                                    TextField("Enter Email", text: $email)
                                        .focused($focusedField, equals: .email)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 10)
                                        .frame(width: 343.14, height: 42.76)
                                        .background(
                                            RoundedRectangle(cornerRadius: 7.36)
                                                .fill(focusedField == .email ? Color.blue.opacity(0.1) : Color.white)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 7.36)
                                                .stroke(
                                                    emailBorderColor,
                                                    lineWidth: borderWidth(for: .email)
                                                )
                                        )
                                        .textInputAutocapitalization(.never)
                                        .keyboardType(.emailAddress)
                                        .autocorrectionDisabled(true)
                                        .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
                                    
                                    if !email.isEmpty && !isEmailValid {
                                        Text("Invalid email address")
                                            .font(.system(size: 13, weight: .regular))
                                            .foregroundColor(.red)
                                    }
                                }
                                
                                Text("Password")
                                    .font(.system(size: 16.55, weight: .regular))
                                    .foregroundStyle(Color(hex: "#37383B"))
                                
                                SecureField("Enter Password", text: $password)
                                    .focused($focusedField, equals: .password)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 10)
                                    .frame(width: 343.14, height: 42.76)
                                    .background(
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .fill(focusedField == .password ? Color.blue.opacity(0.1) : Color.white)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .stroke(
                                                focusedField == .password ? Color.blue.opacity(0.9) : Color(hex: "2F2F2F"),
                                                lineWidth: borderWidth(for: .password)
                                            )
                                    )
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled(true)
                                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Subscription Pack")
                                        .font(.system(size: 16.11, weight: .regular))
                                        .foregroundStyle(Color(hex: "#37383B"))
                                    let isFormValid = !email.isEmpty && !password.isEmpty && isEmailValid
                                    
                                    NavigationLink(destination: OnboardingScreen1A(businessInfo: businessInfo)) {
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .fill(isFormValid ? Color(hex: "FFDA03") : Color(hex: "FFDA03").opacity(0.5))
                                            .frame(width: 343.14, height: 50.12)
                                            .overlay {
                                                HStack {
                                                    Image("paypal")
                                                    .resizable()
                                                    .frame(width:89.51,
                                                        height: 23.74)
                                                    Text("Subscribe")
                                                        .font(.system(size: 13.43, weight: .medium))
                                                        .foregroundStyle(Color(hex: "000000").opacity(isFormValid ? 1 : 0.4))
                                                }
                                            }
                                    }
                                    .disabled(!isFormValid)
                                    
                                    Button {
                                    } label: {
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .fill(isFormValid ? Color(hex: "#000000") : Color(hex: "#000000").opacity(0.4))
                                            .frame(width: 343.14, height: 50.12)
                                            .overlay(
                                                HStack {
                                                    Image(systemName: "creditcard")
                                                        .foregroundStyle(Color.white.opacity(isFormValid ? 1 : 0.6))
                                                    Text("Debit or Credit Card")
                                                        .font(.system(size: 16.11, weight: .regular))
                                                        .foregroundStyle(Color.white.opacity(isFormValid ? 1 : 0.6))
                                                    
                                                }
                                                .padding(.leading, 12)
                                            )
                                    }
                                    .disabled(!isFormValid)
                                    HStack(spacing:0) {
                                        Spacer()
                                        Text("Powered By ")
                                            .italic()
                                            .font(.system(size: 12.11, weight: .regular))
                                            .foregroundStyle(Color.gray)
                                        Image("paypal")
                                            .resizable()
                                            .frame(width:89.51,
                                                height: 18.74)
                                        Spacer()
                                        
                                    }
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
                    .frame(width: 343.14, height: 300)
                    .clipped()
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpScreen()
}
