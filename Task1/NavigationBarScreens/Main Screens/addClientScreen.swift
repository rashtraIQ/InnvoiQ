//
//  addClientScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 07/10/25.
//
//
//  see you again

// ORIGIN IS WORK AND ORIGIN1 IS PERSONAL
import SwiftUI

struct addClientScreen: View {
    @Binding var addClientButtonPressed:Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(width: 398,height: 535)
            .overlay {
                VStack(spacing: 5){
                    Text("Add Client")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(hex: "37383B"))
                    InputForSettingsTypes(heading: "Name", placeholder: "Enter Client's Name")
                    InputForSettingsTypes(heading: "Email", placeholder: "Enter Client's email",keyboardType: .emailAddress)
                    InputForSettingsTypes(heading: "User Taxes", placeholder: "Enter taxes",keyboardType: .numberPad)
                    InputForSettingsTypes(heading: "Phone Number", placeholder: "Enter Phone Number",keyboardType: .numberPad)
                    InputForSettingsTypes(heading: "Address", placeholder: "Enter Address",keyboardType: .numberPad)
                    
                    
                    Button {
                        withAnimation(.spring()) {
                            addClientButtonPressed = false
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 7.03)
                            .fill(Color(hex: "#528EFE"))
                            .frame(width: 126.5,height: 38.65)
                            .overlay {
                                Text("Save Details")
                                    .font(.system(size: 13.18, weight: .semibold))
                                    .foregroundStyle(Color(hex: "ffffff"))
                                    .lineSpacing(7.29)
                            }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 20)
                
            }
        
    }
}

struct titlePlaceholderAndFrameSizes : View{
    var title: String
    var placeholder: String
    var widthOfTF: CGFloat
    var heightOfTF: CGFloat
    
    @State private var text: String = ""
    var body : some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 15.81, weight: .regular))
                .foregroundStyle(Color(hex: "37383B"))
                .lineSpacing(11.09)
            RoundedRectangle(cornerRadius: 7.03)
                .strokeBorder(Color(hex: "#BFC2D1"), lineWidth: 0.88)
                .frame(width: widthOfTF, height: heightOfTF)
                .overlay {
                    TextField(placeholder, text: $text)
                        .foregroundStyle(text.isEmpty ? Color(hex: "94969E") : .black)
                        .padding(.horizontal,15)
                }
        }
    }
}

//#Preview {
//    addClientScreen()
//}

import SwiftUI

struct FloatingButtonExample: View {
    @State private var showPopup = false
    @State private var userName = ""
    @State private var userEmail = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("Main Screen")
                    .font(.largeTitle)
                    .bold()
                
                Button("Show Input Form") {
                    withAnimation(.spring()) {
                        showPopup = true
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            if showPopup {
                Color.black.opacity(0.4) 
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPopup = false
                        }
                    }
                
                VStack(spacing: 20) {
                    Text("Enter Client Details")
                        .font(.headline)
                    
                    TextField("Enter name", text: $userName)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                    TextField("Enter email", text: $userEmail)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .keyboardType(.emailAddress)
                    
                    HStack {
                        Button("Cancel") {
                            withAnimation(.spring()) {
                                showPopup = false
                            }
                        }
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("Save") {
                            print("Saved: \(userName), \(userEmail)")
                            withAnimation(.spring()) {
                                showPopup = false
                            }
                        }
                        .padding()
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
                .frame(width: 300)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 20)
                .transition(.scale.combined(with: .opacity))
                .zIndex(1) // ensure it’s above everything
            }
        }
    }
}

#Preview {
    addClientScreen(addClientButtonPressed: .constant(false))
}
