//
//  ClientViews.swift
//  Task1
//
//  Created by Rashtra Humane on 25/11/25.
//

import Foundation
import SwiftUI
struct cardView : View {
    @Binding var showGridView: Bool
    var body: some View {
        HStack{
            Spacer()
            
            Image("filter")
                .resizable()
                .frame(width:20,height: 20)
            
            Button {
                showGridView = true
            } label: {
                Image("grid")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(showGridView ? Color(hex: "528EFE") : .black)
            }
            
            Button {
                showGridView = false
            } label: {
                Image("list")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(!showGridView ? Color(hex: "528EFE") : .black)
            }
        }
        
    }
}

struct basicGridView : View {
    @State private var addClientButtonisPressed: Bool = false
    var body: some View {
        ZStack {
            HStack{
                Image("lady")
                    .resizable()
                    .frame(width: 68.45,height: 155.14)
                
                VStack(alignment: .center){
                    Text("Your Clients Are Waiting!")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "#37383B"))
                    Button {
                        addClientButtonisPressed.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: "528EFE"))
                            .frame(width: 109,height: 32)
                            .overlay {
                                HStack{
                                    Text("Add Clients")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.white)
                                        .lineSpacing(12)
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 12,height: 12)
                                        .foregroundStyle(Color.white)
                                }
                            }
                    }
                    
                    Text("To Get Started")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "#37383B"))
                }
                .padding(.bottom,110)
                Image("gentlemen")
                    .resizable()
                    .frame(width: 90.08,height: 162.67)
            }
            .padding(50)
            .padding(.leading,20)
            .padding(.top,20)
            if addClientButtonisPressed {
                addClientScreen(addClientButtonPressed: $addClientButtonisPressed)
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(1)
                    .offset(y: -50)
            }
        }
    }
}

struct listView: View {
    @State private var addClientButtonIsPressed: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 70) {
                Rectangle()
                    .frame(height: 25.77)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 12)
               
                
                VStack(alignment: .center) {
                    Spacer()
                    Image("listViewClient")
                        .resizable()
                        .frame(width: 167.29, height: 175)
                    
                    VStack(spacing: 15) {
                        Text("No Clients To Show Yet!")
                            .font(.system(size: 10.79, weight: .regular))
                            .foregroundStyle(Color(hex: "#37383B"))
                        
                        Button {
                            withAnimation(.spring()) {
                                addClientButtonIsPressed.toggle()
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 6.17)
                                .fill(Color(hex: "528EFE"))
                                .frame(width: 84.03, height: 25.17)
                                .overlay {
                                    HStack {
                                        Text("Add Clients")
                                            .font(.system(size: 9.25, weight: .medium))
                                            .foregroundStyle(Color.white)
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 10, height: 10)
                                            .foregroundStyle(Color.white)
                                    }
                                }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom,200)
                    Spacer()
                }
            }
            if addClientButtonIsPressed {
                addClientScreen(addClientButtonPressed: $addClientButtonIsPressed)
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(1)
                    .offset(y: -50)
            }
        }
    }
}

struct searchBar : View {
    @State private var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Clients")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color(hex: "#37383B"))
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color(hex: "#BFC2D1"), lineWidth: 1)
                .frame(width: 342,height: 36)
                .overlay {
                    HStack{
                        TextField("Search", text: $searchText)
                            .padding(.horizontal, 10)
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "94969E"))
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                        
                        Image("searchButton")
                            .resizable()
                            .frame(width:12,height: 12)
                    }
                    .padding(.trailing,10)
                }
        }
    }
}
struct gridView: View {
    var body: some View {
        HStack{
            nameAndText(Colorname: "528EFE", text: "New Client")
            nameAndText(Colorname: "ACF7B6", text: "Full Amount Received")
            nameAndText(Colorname: "FFEE94", text: "Partial Amount Received")
            nameAndText(Colorname: "F9AE86", text: "No Amount Received")
        }
        .padding(.leading,20)
        
        VStack{
            HStack{
                Image("FrameBlue")
                    .resizable()
                    .frame(width: 178,height: 94)
                Image("FrameGreen")
                    .resizable()
                    .frame(width: 178,height: 94)
            }
            HStack{
                Image("FrameYellow")
                    .resizable()
                    .frame(width: 178,height: 94)
                Image("FrameOrange")
                    .resizable()
                    .frame(width: 178,height: 94)
            }
        }
        .padding(.leading,20)
    }
    func nameAndText(Colorname: String, text: String) ->some View{
         var body: some View {
            HStack{
                Circle()
                    .fill(Color(hex: Colorname))
                    .frame(width: 6.62,height: 6.62)
                Text(text)
                    .font(.system(size: 6.62, weight: .medium))
                    .foregroundStyle(Color(hex: "#000000"))
                    .lineSpacing(14.38)
            }
        }
        
        return body
    }
}

struct clientAPIData: View {
    let client: ClientModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: .infinity,height: 200)
                .foregroundStyle(Color(hex: "F5F5F9"))
            HStack {
                VStack(alignment: .leading,spacing: 15){
                    Text("Sr. No")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))
                    Text("Name")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))
                    Text("Address")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))
                    Text("Taxes")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(hex: "#000000"))
                }
                .frame(width: .infinity)
                VStack(alignment: .leading,spacing: 15){
                    Text("\(client.id)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color(hex: "#000000"))
                    Text(client.name)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color(hex: "#000000"))
                    Text(client.address)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color(hex: "#000000"))
                    HStack(spacing: 0){
                        Text(client.taxes.taxName)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(Color(hex: "#000000"))
                        Text("(\(client.taxes.taxRate)%)")
                            .font(.system(size: 8, weight: .regular))
                            .foregroundStyle(Color(hex: "#94969E"))
                    }
                    
                }
                .frame(width: .infinity)
            }
        }
        .padding(.leading,15)
        .padding(.trailing,15)
        
    }
}
//#Preview{
//    clientAPIData()
//}
