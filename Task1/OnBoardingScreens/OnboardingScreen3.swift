//import SwiftUI
//import PhotosUI
//
//struct OnboardingScreen3: View {
//    @ObservedObject var businessInfo: BusinessInfo   // ✅ shared state
//    @State private var selectedItem: PhotosPickerItem? = nil
//    @State private var selectedImageData: Data? = nil
//    
//    var body: some View {
//        NavigationStack{
//            ZStack(alignment: .bottom) {
//                VStack(alignment: .leading, spacing: 25) {
//                    
//                    ProgressBar(currentStep: 3)
//                    
//                    Text("Upload Your Business Logo")
//                        .font(.system(size: 21.52, weight: .bold))
//                        .foregroundStyle(Color(hex: "#000000"))
//                    
//                    Text("Add a business logo here")
//                        .font(.system(size: 14, weight: .semibold))
//                        .foregroundStyle(Color(hex: "#4B5563"))
//                    
//                    VStack(alignment: .leading, spacing: 45) {
//                        
//                        // ✅ Upload button
//                        PhotosPicker(
//                            selection: $selectedItem,
//                            matching: .images,
//                            photoLibrary: .shared()
//                        ) {
//                            RoundedRectangle(cornerRadius: 5)
//                                .fill(Color(hex: "F9AE86"))
//                                .frame(width: 203, height: 50)
//                                .overlay {
//                                    HStack {
//                                        Text("Upload File")
//                                            .font(.system(size: 18, weight: .semibold))
//                                            .foregroundStyle(Color(hex: "#3C3C3B"))
//                                        
//                                        Image(systemName: "arrow.up")
//                                            .resizable()
//                                            .frame(width: 18, height: 18)
//                                            .foregroundStyle(Color(hex: "#6A6A69"))
//                                    }
//                                }
//                        }
//                        .onChange(of: selectedItem) { newItem in
//                            Task { @MainActor in
//                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
//                                    selectedImageData = data
//                                }
//                            }
//                        }
//                        
//                        NavigationLink(
//                            destination: NavigationBar()) {
//                                RoundedRectangle(cornerRadius: 7.36)
//                                    .fill(businessInfo.name.isEmpty ? Color(hex: "#B3D4FF") : Color(hex: "#528EFE"))
//                                    .frame(width: 343.14, height: 51.5)
//                                    .overlay {
//                                        HStack {
//                                            Text("Continue")
//                                                .font(.system(size: 13.79, weight: .semibold))
//                                                .foregroundStyle(Color.white)
//                                            
//                                            Image(systemName: "chevron.right")
//                                                .foregroundStyle(Color.white)
//                                        }
//                                    }
//                            }
//                            .disabled(businessInfo.name.isEmpty)
//                    }
//                    
//                    Spacer()
//                }
//                .padding(.leading, 20)
//                
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(height: UIScreen.main.bounds.height * 0.42)
//                    .frame(maxWidth: .infinity)
//                    .ignoresSafeArea(edges: .bottom)
//                
//                Rectangle()
//                    .fill(Color.white)
//                    .frame(width: 340.57, height: 325)
//                    .overlay {
//                        VStack {
//                            HStack {
//                                Circle()
//                                    .fill(Color(hex: "D9D9D9"))
//                                    .frame(width: 46.87, height: 46.87)
//                                    .overlay {
//                                        if let data = selectedImageData,
//                                           let uiImage = UIImage(data: data) {
//                                            
//                                            Image(uiImage: uiImage)
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: 46.87, height: 46.87)
//                                                .clipShape(Circle())
//                                        } else if !businessInfo.name.isEmpty {
//                                            
//                                            Text(String(businessInfo.name.prefix(1)).uppercased())
//                                                .font(.system(size: 18, weight: .bold))
//                                                .foregroundStyle(Color(hex: "0A2540"))
//                                        } else {
//                                            Text("Add")
//                                                .font(.system(size: 10, weight: .regular))
//                                                .multilineTextAlignment(.center)
//                                                .foregroundStyle(Color(hex: "0A2540"))
//                                        }
//                                    }
//                                Spacer()
//                            }
//                            .padding(.leading, 12)
//                            .padding(.top, 25)
//                            
//                            Spacer()
//                        }
//                    }
//                    .ignoresSafeArea(edges: .bottom)
//            }
//            .navigationBarBackButtonHidden(true)
//            .edgesIgnoringSafeArea(.bottom)
//        }
//    }
//}
//
//#Preview {
//    OnboardingScreen3(businessInfo: BusinessInfo())
//}
//


import SwiftUI
import PhotosUI

struct OnboardingScreen3: View {
    @ObservedObject var businessInfo: BusinessInfo
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
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
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color.white)
                                           .frame(height: UIScreen.main.bounds.height * 0.42)
                                           .frame(maxWidth: .infinity)
                            
                            HStack {
                                Circle()
                                    .fill(Color(hex: "D9D9D9"))
                                    .frame(width: 46.87, height: 46.87)
                                    .overlay {
                                        if let data = selectedImageData,
                                           let uiImage = UIImage(data: data) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 46.87, height: 46.87)
                                                .clipShape(Circle())
                                        } else if !businessInfo.name.isEmpty {
                                            Text(String(businessInfo.name.prefix(1)).uppercased())
                                                .font(.system(size: 18, weight: .bold))
                                                .foregroundStyle(Color(hex: "0A2540"))
                                        } else {
                                            Text("Add")
                                                .font(.system(size: 10, weight: .regular))
                                                .foregroundStyle(Color(hex: "0A2540"))
                                        }
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
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    ProgressBar(currentStep: 4)
                    
                    Text("Upload Your Business Logo")
                        .font(.system(size: 21.52, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))
                    
                    Text("Add a business logo here")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color(hex: "#4B5563"))
                    
                    VStack(alignment: .leading, spacing: 45) {
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(hex: "F9AE86"))
                                .frame(width: 203, height: 50)
                                .overlay {
                                    HStack {
                                        Text("Upload File")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundStyle(Color(hex: "#3C3C3B"))
                                        
                                        Image(systemName: "arrow.up")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                            .foregroundStyle(Color(hex: "#6A6A69"))
                                    }
                                }
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task { @MainActor in
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                        
                        NavigationLink(destination: MainBottomBar()) {
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
                    Spacer()
                }
                .padding(.leading, 20)
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    OnboardingScreen3(businessInfo: BusinessInfo())
}
