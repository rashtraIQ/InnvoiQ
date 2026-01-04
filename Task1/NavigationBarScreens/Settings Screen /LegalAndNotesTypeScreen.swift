//
//  LegalAndNotesTypeScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 13/10/25.
//

import SwiftUI

struct LegalAndNotesTypeScreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            VStack(alignment: .leading){
                Text("Legal & Notes")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#37383B"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.6)
                        VStack(alignment: .leading,spacing: 20){
                            
                            InputForSettingsTypes(heading: "Legal Notes",
                                                  placeholder: "Enter Notes",
                                                fieldHeight: 149)
                            InputForSettingsTypes(heading: "Terms & Conditions",
                                                  placeholder: "Enter Terms & Conditions",
                                                fieldHeight: 149)
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
    LegalAndNotesTypeScreen()
}
