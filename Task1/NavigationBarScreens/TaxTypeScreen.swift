//
//  TaxTypeScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 13/10/25.
//

import SwiftUI

struct TaxTypeScreen: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            VStack(alignment:.leading){
                Text("Tax Settings | Manage Invoice Setting with Tax Law")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#37383B"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                
               ScrollView {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.6)
                        VStack(alignment: .leading){
                            DropdownInputType(heading: "Select Country", placeholder: "Select Country", options: ["India", "USA", "The Great Britian","Italy"])
                            InputForSettingsTypes(heading: "Tax Type", placeholder: "Select Tax Type")
                            InputForSettingsTypes(heading: "Tax Rate (%)", placeholder: "18%",keyboardType: .numberPad)
                            InputForSettingsTypes(heading: "Tax Registration Number", placeholder: "Enter Tax Registration Number",keyboardType: .numberPad)
                            Button {
                                
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(hex: "528EFE"))
                                        .frame(width: 320,height: 44)
                                    Text("Save Details")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundStyle(Color(hex: "FFFFFF"))
                                        .lineSpacing(9)
                                }
                                .padding(.leading,20)
                            }
                            Spacer()
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

struct customDropDown: View {
    var heading: String
    var placeholder: String
    var countries = ["India", "United States", "Canada", "Germany", "Australia", "Japan"]
    @State private var selectedCountry: String = ""
    @State private var isDropdownVisible = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 350, height: 100)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(heading)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color(hex: "37383B"))
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color(hex: "#BFC2D1"), lineWidth: 1)
                        .frame(width: 330, height: 46)
                        .overlay(
                            HStack {
                                Text(selectedCountry.isEmpty ? placeholder : selectedCountry)
                                    .foregroundStyle(selectedCountry.isEmpty ? Color(hex: "94969E") : .black)
                                
                                Spacer()
                                
                                Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                                    .foregroundColor(Color(hex: "94969E"))
                            }
                                .padding(.horizontal, 15)
                                .onTapGesture {
                                    withAnimation {
                                        isDropdownVisible.toggle()
                                    }
                                }
                        )
                    
                    if isDropdownVisible {
                        VStack(spacing: 0) {
                            ForEach(countries, id: \.self) { country in
                                Button {
                                    selectedCountry = country
                                    isDropdownVisible = false
                                } label: {
                                    HStack {
                                        Text(country)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 8)
                                        Spacer()
                                    }
                                    .padding(.horizontal, 15)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                if country != countries.last {
                                    Divider()
                                }
                            }
                        }
                        .frame(width: 330)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .offset(y: 60)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}


#Preview {
    TaxTypeScreen()
}
