//
//  NavigationBar.swift
//  Task1
//
//  Created by Rashtra Humane on 01/10/25.
//

import SwiftUI

struct MainBottomBar: View {
    @State private var selectedTab: Tab = .dashboard
    @State private var isInvoiceScreenPresented = false
    
    enum Tab {
        case dashboard, clients, items, settings
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                switch selectedTab {
                case .dashboard:
                    DashboardScreen()
                case .clients:
                    ClientScreen()
                case .items:
                    ItemsScreen()
                case .settings:
//                    SettingsScreen()
               
                }
                Spacer(minLength: 0)
            }
            
            ZStack {
                CurvedTabBarShape()
                    .fill(Color(hex: "FAFAFA"))
                    .frame(height: 82)
                    .shadow(color: .gray.opacity(0.15), radius: 5, y: -2)
                    .overlay {
                        HStack {
                            Dashboard(isSelected: selectedTab == .dashboard) {
                                selectedTab = .dashboard
                            }
                            .frame(maxWidth: .infinity)
   
                            Clients(isSelected: selectedTab == .clients) {
                                selectedTab = .clients
                            }
                            .frame(maxWidth: .infinity)
                            
                            Items(isSelected: selectedTab == .items) {
                                selectedTab = .items
                            }
                            .frame(maxWidth: .infinity)
                            
                            SettingsButton(isSelected: selectedTab == .settings){
                                selectedTab = .settings
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 10)
                    }
                
                
            }
            
            Button {
                isInvoiceScreenPresented = true
            } label: {

                ZStack {
                    Image("EllipseButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75)
                        .shadow(color: .black.opacity(0.2), radius: 5, y: 5)
                    Image("invoices")
                        .resizable()
                        .foregroundStyle(Color.black)
                        .frame(width: 60,height: 40)
                        .padding(.bottom,8)
                }
            }
            .buttonStyle(.plain)
            .offset(y: -55)
            .navigationDestination(isPresented: $isInvoiceScreenPresented) { 
                InvoicesScreen()
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CurvedTabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let curveHeight: CGFloat = 30
        let curveWidth: CGFloat = 110
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: (rect.width - curveWidth) / 2, y: 0))
        
        path.addCurve(
            to: CGPoint(x: rect.width / 2, y: curveHeight),
            control1: CGPoint(x: rect.width / 2 - curveWidth / 3, y: 0),
            control2: CGPoint(x: rect.width / 2 - curveWidth / 4, y: curveHeight)
        )
        
        path.addCurve(
            to: CGPoint(x: (rect.width + curveWidth) / 2, y: 0),
            control1: CGPoint(x: rect.width / 2 + curveWidth / 4, y: curveHeight),
            control2: CGPoint(x: rect.width / 2 + curveWidth / 3, y: 0)
        )
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}


struct topView : View {
    var body: some View {
        HStack{
            HStack(spacing:0){
                Text("Invoi")
                    .font(.system(size: 15.7, weight: .bold))
                    .foregroundStyle(Color(hex: "#528EFE"))
                Text("Q")
                    .font(.system(size: 15.7, weight: .bold))
                    .foregroundStyle(Color(hex: "#F9AE86"))
                
            }
            Spacer()
            Text("Hey,krati")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color(hex: "#182222"))
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
    }
}

struct Dashboard : View {
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: action){
            VStack{
                Image("stateLayer")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 64, height: 32)
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "#2B3232"))
                Text("Dashboard")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "2B3232"))
            }
        }
    }
}


struct Clients : View {
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack{
                Image("person.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 64, height: 32)
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "#2B3232"))
                Text("Clients")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "2B3232"))
            }
        }
    }
}

struct Items : View {
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button (action: action) {
            VStack{
                Image("items")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 64, height: 32)
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "#2B3232"))
                Text("Items")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "2B3232"))
            }
        }
    }
}

struct SettingsButton : View {
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button (action: action) {
            VStack{
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "FAFAFA"))
                        .frame(width: 64,height: 32)
                    Image("icon")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "#2B3232"))
                    
                }
                Text("Settings")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(isSelected ? Color(hex: "528EFE") : Color(hex: "2B3232"))
            }
        }
    }
}



#Preview {
    MainBottomBar()
}
