//
//  InvoicesScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 08/10/25.
//

import SwiftUI

struct InvoicesScreen: View {
    @State private var showGridView1: Bool = true
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 30){
                topView()
                searchBarInvoices()
                    .padding(.leading,20)
                cardViewInvoices(showGridView: $showGridView1)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                if showGridView1 {
                    basicGridViewInvoices()
                } else {
                    listViewInvoices()
                }
                Spacer()
                //            bottomView()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct cardViewInvoices : View {
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

struct basicGridViewInvoices : View {
    @State private var addInvoiceButtonisPressed: Bool = false
    var body: some View {
        ZStack {
            HStack{
                Image("lady")
                    .resizable()
                    .frame(width: 68.45,height: 155.14)
                
                VStack(alignment: .center){
                    Text("Your Invoices Are Waiting!")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "#37383B"))
                    
                    NavigationLink(destination: addInvoiceScreen(addInvoiceButtonPressed: $addInvoiceButtonisPressed)){
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: "528EFE"))
                            .frame(width: 109,height: 32)
                            .overlay {
                                HStack{
                                    Text("Add Invoice")
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
//                    Button {
//                        addInvoiceButtonisPressed.toggle()
//                    } label: {
//                        
//                    }
                    
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
        }
    }
}

struct listViewInvoices: View {
    @State private var addInvoiceButtonisPressed: Bool = false
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
                        Text("No Invoices To Show Yet!")
                            .font(.system(size: 10.79, weight: .regular))
                            .foregroundStyle(Color(hex: "#37383B"))
                        NavigationLink(destination: addInvoiceScreen(addInvoiceButtonPressed: $addInvoiceButtonisPressed)){
                            RoundedRectangle(cornerRadius: 6.17)
                                .fill(Color(hex: "528EFE"))
                                .frame(width: 84.03, height: 25.17)
                                .overlay {
                                    HStack {
                                        Text("Add Invoice")
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
        }
    }
}

struct searchBarInvoices : View {
    @State private var searchText: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("Invoices")
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



#Preview {
    InvoicesScreen()
}
