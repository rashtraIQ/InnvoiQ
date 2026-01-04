//
//  BusinessTypeScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 13/10/25.
//

import SwiftUI

struct BusinessTypeScreen: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            VStack(alignment: .leading) {
                Text("Business Settings | Configure Business Details")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#37383B"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                
                ScrollView{
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .padding(.trailing,20)
                            .padding(.bottom,5)
                            
                        VStack(alignment: .leading,spacing: 0){
                            CustomHeading(heading: "General Settings")
                            InputForSettingsTypes(heading: "Business Name", placeholder: "Enter Business Name")
                            InputForSettingsTypes(heading: "Business Contact", placeholder: "Enter Business Contact",keyboardType: .numberPad)
                            InputForSettingsTypes(heading: "Business Country", placeholder: "Enter Business Country")
                            InputForSettingsTypes(heading: "Business Address", placeholder: "Enter Address")
                            InputForSettingsTypes(heading: "Business Email", placeholder: "Enter Email",keyboardType: .emailAddress)
                            InputForSettingsTypes(heading: "Website (optional)", placeholder: "Enter Website")
                            
                            CustomHeading(heading: "Contact Settings")
                            InputForSettingsTypes(heading: "Primary Contact", placeholder: "Enter Contact",keyboardType: .numberPad)
                            InputForSettingsTypes(heading: "Primary Email", placeholder: "Enter Email",keyboardType: .emailAddress)
                            CustomHeading(heading: "Brand Settings")
                            Spacer()
                            UploadImageView()
                        }
                    }
                }
                .padding(.leading,10)
            }
            .padding(.top,30)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomHeading : View {
    var heading: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(hex: "#528EFE"))
                .frame(width: 350,height: 46)
                .overlay {
                    HStack(alignment: .top){
                        Text(heading)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(Color(hex: "FFFFFF"))
                        Spacer()
                    }
                    .padding(.leading, 20)
                }
        }
    }
}

struct InputForSettingsTypes: View {
    var heading: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    var fieldHeight : CGFloat? = nil
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 350, height: 120)
                
                 
            VStack(alignment: .leading){
                Text(heading)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color(hex: "37383B"))
                    .lineSpacing(12)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 330, height: fieldHeight ?? 46)
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(isFocused ? Color(hex: "528EFE") : Color(hex: "#BFC2D1"), lineWidth: 1.5)
                            .overlay(
                                TextField(placeholder, text: $text)
                                    .keyboardType(keyboardType)
                                    .foregroundStyle(text.isEmpty ? Color(hex: "94969E") : .black)
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, (fieldHeight ?? 46) > 46 ? 100 : 0)
                                    .focused($isFocused)
                            )
                    )
                    
                
            }
            .padding(.horizontal,20)
        }
    }
}

import PhotosUI

struct UploadImageView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("Upload Your Business Logo")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color(hex: "000000"))

                Text("Add a business logo here")
                    .font(.system(size: 14.63))
                    .foregroundStyle(Color(hex: "4B5563"))

                // Upload button
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(hex: "F9AE86"))
                            .frame(width: 203, height: 50)
                        HStack {
                            Text("Upload File")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color(hex: "3C3C3B"))
                            Image(systemName: "arrow.up")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color(hex: "6A6A69"))
                        }
                    }
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = uiImage
                        }
                    }
                }

                ZStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 220, height: 146)
                            .clipped()
                            .cornerRadius(8)
                    } else {
                        Rectangle()
                            .fill(Color(hex: "BFC2D1"))
                            .frame(width: 220, height: 146)
                            .overlay(
                                Text("Preview")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(Color(hex: "37383B"))
                            )
                    }
                }

                Button {
                    // save action
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: "528EFE"))
                            .frame(width: 300, height: 44)
                        Text("Save Details")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color(hex: "FFFFFF"))
                    }
                }
            }

            Spacer()
        }
        .padding(.leading, 36)
    }
}



#Preview {
    BusinessTypeScreen()
}
