////
////  LogInScreen.swift
////  Task1
////
////  Created by Rashtra Humane on 17/09/25.
//
//import SwiftUI
//
//struct LogInScreen: View {
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @State private var signUpTapped: Bool = false
//    @FocusState private var focusedField: Field?
//    
//    enum Field {
//        case email, password
//    }
//    
//    var isEmailValid: Bool {
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
//    }
//    
//    var body: some View {
//        NavigationStack {
//            ZStack(alignment: .bottom) {
//                VStack(spacing: 20) {
//                    HStack(spacing:0){
//                        Text("Invoi")
//                            .font(.system(size: 36.3, weight: .bold))
//                            .foregroundStyle(Color(hex: "#528EFE"))
//                        Text("Q")
//                            .font(.system(size: 36.3, weight: .bold))
//                            .foregroundStyle(Color(hex: "#F9AE86"))
//                    }
//                    
//                    HStack {
//                        VStack(alignment: .leading, spacing: 20) {
//                            HStack(spacing: 40){
//                                Text("Log In")
//                                    .font(.system(size: 24, weight: .bold))
//                                    .foregroundStyle(Color(hex: "#528EFE"))
//                                    .lineSpacing(22)
//                                    .overlay(
//                                        Rectangle()
//                                            .fill(Color(hex: "#528EFE"))
//                                            .frame(height: 2.76)
//                                            .offset(y: 10),
//                                        alignment: .bottom
//                                    )
//                                
//                                NavigationLink(destination: SignUpScreen()) {
//                                    Text("Sign Up")
//                                        .font(.system(size: 24, weight: .bold))
//                                        .foregroundStyle(Color(hex: signUpTapped ? "#528EFE" : "37383B"))
//                                        .lineSpacing(22)
//                                        .overlay(
//                                            signUpTapped ?
//                                            Rectangle()
//                                                .fill(Color(hex: "#528EFE"))
//                                                .frame(height: 2.76)
//                                                .offset(y: 10)
//                                            : nil,
//                                            alignment: .bottom
//                                        )
//                                }
//                            }
//                           
//                            VStack(alignment: .leading, spacing: 20) {
//                                Text("Login if you are already a user")
//                                    .font(.system(size: 16.55, weight: .regular))
//                                    .foregroundStyle(Color(hex: "#37383B"))
//                                
//                            
//                                Text("Username")
//                                    .font(.system(size: 16.55, weight: .regular))
//                                    .foregroundStyle(Color(hex: "#37383B"))
//                                
//                                TextField("Enter Email", text: $email)
//                                    .focused($focusedField, equals: .email)
//                                    .padding(.horizontal, 12)
//                                    .padding(.vertical, 10)
//                                    .frame(width: 343.14, height: 42.76)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 7.36)
//                                            .fill(focusedField == .email ? Color.blue.opacity(0.1) : Color.white)
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 7.36)
//                                            .stroke(
//                                                focusedField == .email ? Color.blue.opacity(0.9) :
//                                                (email.isEmpty ? Color(hex: "2F2F2F") :
//                                                    (isEmailValid ? Color(hex: "2F2F2F") : Color.red)),
//                                                lineWidth: 1.5
//                                            )
//                                    )
//                                    .textInputAutocapitalization(.never)
//                                    .keyboardType(.emailAddress)
//                                    .autocorrectionDisabled(true)
//                                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
//                                
//                                if !email.isEmpty && !isEmailValid {
//                                    Text("Invalid email address")
//                                        .font(.system(size: 13, weight: .regular))
//                                        .foregroundColor(.red)
//                                }
//                                Text("Password")
//                                    .font(.system(size: 16.55, weight: .regular))
//                                    .foregroundStyle(Color(hex: "#37383B"))
//                                
//                                SecureField("Enter Password", text: $password)
//                                    .focused($focusedField, equals: .password)
//                                    .padding(.horizontal, 12)
//                                    .padding(.vertical, 10)
//                                    .frame(width: 343.14, height: 42.76)
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 7.36)
//                                            .fill(focusedField == .password ? Color.blue.opacity(0.1) : Color.white)
//                                    )
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 7.36)
//                                            .stroke(
//                                                focusedField == .password ? Color.blue.opacity(0.9) : Color(hex: "2F2F2F"),
//                                                lineWidth: 1.5
//                                            )
//                                    )
//                                    .textInputAutocapitalization(.never)
//                                    .autocorrectionDisabled(true)
//                                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
//                                
//                                Button {
//                                    
//                                } label: {
//                                    Text("Forgot Password?")
//                                        .font(.system(size: 16.55, weight: .regular))
//                                        .foregroundStyle(Color(hex: "#37383B"))
//                                }
//                                
//                                
//                                NavigationLink(
//                                    destination: SignUpScreen(),
//                                    label: {
//                                        RoundedRectangle(cornerRadius: 7.36)
//                                            .fill(
//                                                (email.isEmpty || password.isEmpty || !isEmailValid)
//                                                ? Color(hex: "#B3D4FF")
//                                                : Color(hex: "#528EFE")
//                                            )
//                                            .frame(width: 343.14, height: 51.5)
//                                            .overlay {
//                                                HStack {
//                                                    Text("Log In")
//                                                        .font(.system(size: 13.79, weight: .semibold))
//                                                        .foregroundStyle(Color.white)
//                                                    
//                                                    Image(systemName: "chevron.right")
//                                                        .foregroundStyle(Color.white)
//                                                }
//                                            }
//                                    })
//                               
//                                .disabled(email.isEmpty || password.isEmpty || !isEmailValid)
//                            }
//                        }
//                        .padding(.leading, 30)
//                        
//                        Spacer()
//                    }
//                    
//                    Spacer()
//                }
//                
//                Rectangle()
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(stops: [
//                                .init(color: Color(hex: "#79ADCC"), location: 0.0),
//                                .init(color: Color(hex: "#D5AE9A"), location: 0.51),
//                                .init(color: Color(hex: "#F9AE86"), location: 0.72),
//                                .init(color: Color(hex: "#F9AE86"), location: 0.78),
//                            ]),
//                            startPoint: .top,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .frame(height: UIScreen.main.bounds.height * 0.27)
//                    .frame(maxWidth: .infinity)
//                
//                Image("Dashboard")
//                    .resizable()
//                    .frame(width: 343.14,height: 300)
//                    .clipped()
//            }
//            .ignoresSafeArea(edges: .bottom)
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//
//
//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        _ = scanner.scanString("#")
//        var rgb: UInt64 = 0
//        scanner.scanHexInt64(&rgb)
//        let r = Double((rgb >> 16) & 0xFF) / 255
//        let g = Double((rgb >> 8) & 0xFF) / 255
//        let b = Double(rgb & 0xFF) / 255
//        self.init(red: r, green: g, blue: b)
//    }
//}
//
//#Preview {
//    LogInScreen()
//}

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
    @FocusState private var focusedField: Field?
    
    enum Field {
        case email, password
    }
    
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    var body: some View {
        NavigationStack {
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
                                
                                NavigationLink(destination: SignUpScreen()) {
                                    Text("Sign Up")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(Color(hex: signUpTapped ? "#528EFE" : "37383B"))
                                        .lineSpacing(22)
                                        .overlay(
                                            signUpTapped ?
                                            Rectangle()
                                                .fill(Color(hex: "#528EFE"))
                                                .frame(height: 2.76)
                                                .offset(y: 10)
                                            : nil,
                                            alignment: .bottom
                                        )
                                }
                            }
                           
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Login if you are already a user")
                                    .font(.system(size: 16.55, weight: .regular))
                                    .foregroundStyle(Color(hex: "#37383B"))
                                
                                Text("Username")
                                    .font(.system(size: 16.55, weight: .regular))
                                    .foregroundStyle(Color(hex: "#37383B"))
                                
                                TextField("Enter Email", text: $email)
                                    .focused($focusedField, equals: .email)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 10)
                                    .frame(width: 343.14, height: 42.76)
                                    .background(
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .fill(focusedField == .email ? Color.blue.opacity(0.05) : Color.white)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .stroke(
                                                email.isEmpty
                                                    ? Color(hex: "2F2F2F")
                                                    : (isEmailValid ? Color.blue.opacity(0.9) : Color.red),
                                                lineWidth: focusedField == .email ? 2 : 1.5
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
                                            .fill(focusedField == .password ? Color.blue.opacity(0.05) : Color.white)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .stroke(
                                                focusedField == .password ? Color.blue.opacity(0.9) : Color(hex: "2F2F2F"),
                                                lineWidth: focusedField == .password ? 2 : 1.5
                                            )
                                    )
                                    .textInputAutocapitalization(.never)
                                    .autocorrectionDisabled(true)
                                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 2)
                                
                                Button {
                                    // Forgot Password Action
                                } label: {
                                    Text("Forgot Password?")
                                        .font(.system(size: 16.55, weight: .regular))
                                        .foregroundStyle(Color(hex: "#37383B"))
                                }
                                
                                NavigationLink(
                                    destination: MainBottomBar(),
                                    label: {
                                        RoundedRectangle(cornerRadius: 7.36)
                                            .fill(
                                                (email.isEmpty || password.isEmpty || !isEmailValid)
                                                ? Color(hex: "#B3D4FF")
                                                : Color(hex: "#528EFE")
                                            )
                                            .frame(width: 343.14, height: 51.5)
                                            .overlay {
                                                HStack {
                                                    Text("Log In")
                                                        .font(.system(size: 13.79, weight: .semibold))
                                                        .foregroundStyle(Color.white)
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .foregroundStyle(Color.white)
                                                }
                                            }
                                    })
                                .disabled(email.isEmpty || password.isEmpty || !isEmailValid)
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
        .navigationBarBackButtonHidden(true)
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

