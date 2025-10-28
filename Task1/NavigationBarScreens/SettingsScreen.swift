//
//  SettingsScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 10/10/25.



//////import SwiftUI
////
//struct SettingsScreen: View {
//    @State private var selectedType: SettingsTypes = .businessType
//    
//    
//    enum SettingsTypes {
//        case businessType, taxType, paymentType, legalAndNotesType, miscellaneousType
//    }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            VStack(alignment: .leading, spacing: 0) {
//                typesOfSettings(imageName: "businessSetting", isSelected: selectedType == .businessType) {
//                    selectedType = .businessType
//                }
//                
//                typesOfSettings(imageName: "taxType", isSelected: selectedType == .taxType) {
//                    selectedType = .taxType
//                }
//                
//                typesOfSettings(imageName: "paymentType", isSelected: selectedType == .paymentType) {
//                    selectedType = .paymentType
//                }
//                
//                typesOfSettings(imageName: "legalAndNotesType", isSelected: selectedType == .legalAndNotesType) {
//                    selectedType = .legalAndNotesType
//                }
//                
//                typesOfSettings(imageName: "miscellaneousType", isSelected: selectedType == .miscellaneousType) {
//                    selectedType = .miscellaneousType
//                }
//                
//                Spacer()
//            }
//            .frame(width: 72)
//            .padding(.top, 20)
//            .background(Color.white)
//            .edgesIgnoringSafeArea(.all)
//            
//            topBarForSettings()
//            ZStack {
//                Color.white.ignoresSafeArea()
//                switch selectedType {
//                case .businessType:
//                    BusinessTypeScreen()
//                case .taxType:
//                    TaxTypeScreen()
//                case .paymentType:
//                    PaymentTypeScreen()
//                case .legalAndNotesType:
//                    LegalAndNotesTypeScreen()
//                case .miscellaneousType:
//                    MiscellaneousTypeScreen()
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//    }
//}
//
struct typesOfSettings: View {
    var imageName: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 64, height: 64)
                
                Image(imageName)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ? Color(hex: "528EFE") : Color(hex: "37383B"))
            }
        }
        .padding(.vertical, 8)
    }
}
////
//struct topBarForSettings: View {
//    @State private var isExpanded = false
//    var body: some View {
//        HStack{
//            HStack {
//                Button {
//                    isExpanded.toggle()
//                    if(isExpanded){
//                    }
//                    
//                } label: {
//                    Image(systemName: "line.3.horizontal")
//                        .renderingMode(.template)
//                        .frame(width: 18,height: 18)
//                        .foregroundStyle(isExpanded ? Color(hex: "#528EFE") : Color(hex: "#37383B"))
//                }
//
//                HStack(spacing:0){
//                    Text("Invoi")
//                        .font(.system(size: 22, weight: .bold))
//                        .foregroundStyle(Color(hex: "#528EFE"))
//                    Text("Q")
//                        .font(.system(size: 22, weight: .bold))
//                        .foregroundStyle(Color(hex: "#F9AE86"))
//                    
//                }
//            }
//            Spacer()
//            Text("Hey,krati")
//                .font(.system(size: 20, weight: .regular))
//                .foregroundStyle(Color(hex: "#182222"))
//            
//            Button {
//                
//            } label: {
//                Image("icon")
//                    .resizable()
//                    .frame(width: 22,height: 22)
//            }
//        }
//        .padding(.leading,20)
//        .padding(.trailing,20)
//    }
//}
////
////#Preview {
////    SettingsScreen()
////}
import SwiftUI

struct SettingsScreen: View {
    @State private var selectedType: SettingsTypes = .businessType
    @State private var showMenu = false
    @State private var isLoggedOut = false
    
    enum SettingsTypes {
        case businessType, taxType, paymentType, legalAndNotesType, miscellaneousType
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // MARK: - Main Content
            VStack(spacing: 0) {
                topBarForSettings(showMenu: $showMenu) // 👈 pass binding
                
                ZStack {
                    Color.white.ignoresSafeArea()
                    switch selectedType {
                    case .businessType:
                        BusinessTypeScreen()
                    case .taxType:
                        TaxTypeScreen()
                    case .paymentType:
                        PaymentTypeScreen()
                    case .legalAndNotesType:
                        LegalAndNotesTypeScreen()
                    case .miscellaneousType:
                        MiscellaneousTypeScreen()
                    }
                }
            }
            .zIndex(0)
            
            // MARK: - Overlay Menu
            if showMenu {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showMenu = false
                        }
                    }
                    .zIndex(1)
                
                sideMenu(selectedType: $selectedType, showMenu: $showMenu,isLoggedOut: $isLoggedOut)
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .fullScreenCover(isPresented: $isLoggedOut) {
            LogInScreen()
        }
        .navigationBarBackButtonHidden(true)
        .animation(.spring(), value: showMenu)
    }
}

struct topBarForSettings: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        HStack {
            // MARK: Menu Button
            Button {
                withAnimation(.spring()) {
                    showMenu.toggle()
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .renderingMode(.template)
                    .frame(width: 18, height: 18)
                    .foregroundStyle(showMenu ? Color(hex: "#528EFE") : Color(hex: "#37383B"))
            }
            
            HStack(spacing: 0) {
                Text("Invoi")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(Color(hex: "#528EFE"))
                Text("Q")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(Color(hex: "#F9AE86"))
            }
            
            Spacer()
            
            Text("Hey, Krati")
                .font(.system(size: 20, weight: .regular))
                .foregroundStyle(Color(hex: "#182222"))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.white.shadow(radius: 2))
    }
}

struct sideMenu: View {
    @Binding var selectedType: SettingsScreen.SettingsTypes
    @Binding var showMenu: Bool
    @Binding var isLoggedOut: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.spring()) {
                    showMenu = false
                }
            } label: {
                    
                    HStack {
                        Image("closeMenu")
                            .resizable()
                            .frame(width: 18, height: 12)
                            .foregroundColor(Color(hex: "37383B"))
                        
                        Text("Close Menu")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(Color(hex: "37383B"))
                            .lineSpacing(12)
                        
                        Spacer()
                    }
                
            }
            .padding(.vertical, 16)
            
                menuButton(title: "Business",
                           imageName: "businessType",
                           type: .businessType,
                           selectedType: $selectedType,
                           showMenu: $showMenu)
                menuButton(title: "Tax",
                           imageName: "taxType",
                           type: .taxType,
                           selectedType: $selectedType,
                           showMenu: $showMenu)
                menuButton(title: "Payment",
                           imageName: "paymentType",
                           type: .paymentType,
                           selectedType: $selectedType,
                           showMenu: $showMenu)
                menuButton(title: "Legal And Notes",
                           imageName: "legalAndNotesType",
                           type: .legalAndNotesType,
                           selectedType: $selectedType,
                           showMenu: $showMenu)
                menuButton(title: "Miscellaneous",
                       imageName: "miscellaneousType",
                       type: .miscellaneousType,
                       selectedType: $selectedType,
                       showMenu: $showMenu)
            
            LogoutButtonView(isLoggedOut: $isLoggedOut)
//            Button {
//                withAnimation(.easeInOut) {
//                    isLoggedOut = true
//                }
//            } label: {
//                HStack(spacing:12) {
//                    Image("logOutButton")
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(Color(hex: "37383B"))
//                    Text("Logout")
//                        .font(.system(size: 18, weight: .regular))
//                        .foregroundColor(Color(hex: "37383B"))
//                        .lineSpacing(12)
//                    Spacer()
//                }
//                
//            }
//            .padding(.vertical, 16)
//            .padding(.leading,3)
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 20)
        .frame(width: 230, height: UIScreen.main.bounds.height)
        .background(Color.white)
//        .shadow(radius: 10)
    }
}
struct menuButton: View {
    var title: String
    var imageName: String
    var type: SettingsScreen.SettingsTypes
    @Binding var selectedType: SettingsScreen.SettingsTypes
    @Binding var showMenu: Bool
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedType = type
                showMenu = false
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 54, height: 54)
                
                HStack {
                    Image(imageName)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedType == type ? Color(hex: "528EFE") : Color(hex: "37383B"))
                    Text(title)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(selectedType == type ? Color(hex: "528EFE") : Color(hex: "37383B"))
                        .lineSpacing(12)
                    Spacer()
                }
                
            }
        }
        .padding(.vertical, 8)
    }
}

struct LogoutButtonView: View {
    @Binding var isLoggedOut: Bool
    @State private var showLogoutAlert = false

    var body: some View {
        Button {
            showLogoutAlert = true
        } label: {
            HStack(spacing: 12) {
                Image("logOutButton")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color(hex: "37383B"))
                
                Text("Logout")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(Color(hex: "37383B"))
                    .lineSpacing(12)
                
                Spacer()
            }
        }
        .padding(.vertical, 16)
        .padding(.leading, 3)
        .alert("Log Out", isPresented: $showLogoutAlert) { // 👈 Alert popup
            Button("Cancel", role: .cancel) { }
            Button("Log Out", role: .destructive) {
                withAnimation(.easeInOut) {
                    isLoggedOut = true // 👈 proceed to log in screen
                }
            }
        } message: {
            Text("Are you sure you want to log out?")
        }
    }
}

//#Preview {
//    LogoutButtonView(isLoggedOut: .constant(false))
//}
#Preview {
    SettingsScreen()
}


