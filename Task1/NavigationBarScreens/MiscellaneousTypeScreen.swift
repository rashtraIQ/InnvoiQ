//
//  MiscellaneousTypeScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 13/10/25.
//

import SwiftUI

struct MiscellaneousTypeScreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            VStack(alignment: .leading){
                Text("Miscellaneous Settings | Manage default miscellaneous for your business")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#37383B"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.6)
                        VStack(alignment: .leading,spacing: 30){
                            
                            InputForSettingsTypes(heading: "Reminder Days", placeholder: "Enter Reminder Days",keyboardType: .numberPad)
                            InputForSettingsTypes(heading: "Default Language", placeholder: "Enter Default Language")
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
                        .padding(.top,30)
                    }
                }
                .padding(.leading,10)
                
            }
            .padding(.top,30)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MiscellaneousTypeScreen()
}
