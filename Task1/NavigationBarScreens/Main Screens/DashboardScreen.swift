//
//  DashboardScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 07/10/25.
//

import SwiftUI

struct DashboardScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.07))
                    .edgesIgnoringSafeArea(.bottom)
                    .edgesIgnoringSafeArea(.top)
                VStack() {
                    topView()
                        .padding(.bottom,40)
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading) {
                            Text("Dashboard")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(Color(hex:"4F5154"))
                                .lineSpacing(12)
                            upperView()
                            HStack(spacing: 15) {
                                middleView1()
                                middleView2()
                            }
                            .padding(.bottom,20)
                            VStack(alignment: .leading,spacing: 25){
                                HStack {
                                    Text("Customer Insights")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(Color.black)
                                        .lineSpacing(12)
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(hex: "528EFE"))
                                            .frame(width: 80,height: 35)
                                            .overlay {
                                                HStack{
                                                    Text("All")
                                                        .font(.system(size: 14, weight: .semibold))
                                                        .foregroundStyle(Color.white)
                                                    Image(systemName: "chevron.down")
                                                        .resizable()
                                                        .frame(width:10,height: 5)
                                                        .foregroundStyle(Color.white)
                                                }
                                            }
                                    }
                                }
                                bottomView()
                            }
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    }
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct bottomView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(width: .infinity,height: 250)
            VStack(spacing: 10) {
                HStack {
                    Text("Customer")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "A0AEC0"))
                        .lineSpacing(12)
                    Spacer()
                    Text("Krati Vyas")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.black)
                        .lineSpacing(12)
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex:"A0AEC0"))
                    .frame(width: .infinity,height: 1)
                HStack {
                    Text("Invoice Amount")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "A0AEC0"))
                        .lineSpacing(12)
                    Spacer()
                    Text("$1534.00")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.black)
                        .lineSpacing(12)
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex:"A0AEC0"))
                    .frame(width: .infinity,height: 1)
                HStack {
                    Text("Received")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "A0AEC0"))
                        .lineSpacing(12)
                    Spacer()
                    Text("$0.00")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color(hex:"3CB64C"))
                        .lineSpacing(12)
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex:"A0AEC0"))
                    .frame(width: .infinity,height: 1)
                HStack {
                    Text("Due")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "A0AEC0"))
                        .lineSpacing(12)
                    Spacer()
                    Text("$1534.00")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color(hex:"DC2525"))
                        .lineSpacing(12)
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hex:"A0AEC0"))
                    .frame(width: .infinity,height: 1)
                
                HStack {
                    Text("Payment status")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "A0AEC0"))
                        .lineSpacing(12)
                    Spacer()
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "F9AE86"))
                        .frame(width:45,height: 40)
                        .overlay {
                            Text("Due")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(Color.black)
                        }
    
                }
            }
            .padding(.leading,15)
            .padding(.trailing,15)
            
        }
    }
}
struct middleView2: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: .infinity,height: 250)
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 8
                    
                )
            VStack(alignment: .leading) {
                HStack(spacing:12){
                    NavigationLink(destination: ClientScreen()) {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(hex: "F9AE86"))
                            .frame(width:70,height:70)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(Color.white)
                                    .frame(width:30,height: 30)
                            }
                    }
                    VStack(alignment: .leading) {
                        Text("Add")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(hex:"F9AE86"))
                            .lineSpacing(12)
                        Text("Clients")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(hex:"F9AE86"))
                            .lineSpacing(12)
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("1")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(Color(hex:"F9AE86"))
                        .lineSpacing(12)
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex:"F9AE86"))
                            .frame(width: 100,height: 30)
                            .overlay {
                                Text("Total clients")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Color.white)
                                    .lineSpacing(12)
                            }
                    }
                    Image("orangeWave")
                        .resizable()
                        .frame(width: .infinity,height: 60)
                }
            }
            .padding(.leading,15)
            .padding(.trailing,15)
        }
    }
}

struct middleView1: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: .infinity,height: 250)
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 8
                )
            VStack(alignment: .leading) {
                HStack(spacing:12){
                    NavigationLink(destination: InvoicesScreen()) {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(hex: "528EFE"))
                            .frame(width:70,height:70)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(Color.white)
                                    .frame(width:30,height: 30)
                            }
                    }
                    VStack(alignment: .leading) {
                        Text("Create")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(hex:"528EFE"))
                            .lineSpacing(12)
                        Text("Invoice")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(hex:"528EFE"))
                            .lineSpacing(12)
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("1")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(Color(hex:"528EFE"))
                        .lineSpacing(12)
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex:"528EFE"))
                            .frame(width: 100,height: 30)
                            .overlay {
                                Text("Total Invoices")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Color.white)
                                    .lineSpacing(12)
                            }
                    }
                    Image("blueWave")
                        .resizable()
                        .frame(width: .infinity,height: 60)
                }
            }
            .padding(.leading,15)
            .padding(.trailing,15)
        }
    }
}

struct upperView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: .infinity,height:160)
                .shadow(
                    color: Color.black.opacity(0.1),
                    radius: 10,
                    x: 0,
                    y: 5
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray.opacity(0.05), lineWidth: 1)
                )
            VStack(alignment: .leading) {
                HStack(spacing: 20){
                    GradientRingView(customColor: "ACF7B6")
                    VStack(alignment: .leading) {
                        Text("Total Received")
                            .font(.system(size: 20,weight: .regular))
                            .foregroundStyle(Color.black)
                            .lineSpacing(12)
                        Text("$0.00")
                            .font(.system(size: 25,weight: .regular))
                            .foregroundStyle(Color(hex:"4F5154"))
                            .lineSpacing(12)
                    }
                }
                HStack(spacing: 20){
                    GradientRingView(customColor: "F9AE86")
                    VStack(alignment: .leading) {
                        Text("Total Due")
                            .font(.system(size: 20,weight: .regular))
                            .foregroundStyle(Color.black)
                            .lineSpacing(12)
                        Text("$1534.00")
                            .font(.system(size: 25,weight: .regular))
                            .foregroundStyle(Color(hex:"4F5154"))
                            .lineSpacing(12)
                    }
                }
            }
            .padding(.trailing,120)
        }
    }
}

struct GradientRingView: View {
    var progress: CGFloat = 0.9
    var customColor: String
    var size: CGFloat = 50
    var lineWidth: CGFloat = 4
    var iconName: String = "arrow.up.right"
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.15), lineWidth: lineWidth)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    LinearGradient(
                        colors: [
                            Color(hex: customColor).opacity(0.8),
                            Color(hex: customColor)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
            Circle()
                .fill(Color.white.opacity(0.9))
                .frame(width: size * 0.75, height: size * 0.75)
                .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 2)
            
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: size * 0.3, height: size * 0.3)
                .foregroundColor(Color.black.opacity(0.6))
        }
        .frame(width: size, height: size)
    }
}



#Preview {
    DashboardScreen()
}
