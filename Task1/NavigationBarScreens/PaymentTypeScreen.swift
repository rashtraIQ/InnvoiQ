//
//  PaymentTypeScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 13/10/25.
//

import SwiftUI

struct PaymentTypeScreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            VStack(alignment: .leading){
                Text("Payment Settings | Configure Payment Settings for your business")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(hex: "#37383B"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30)
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.6)
                        
                        VStack(alignment: .leading){
                            InputForSettingsTypes(heading: "Bank Name", placeholder: "Enter Bank Nam")
                            DropdownInputType(heading: "Default Currency", placeholder: "US Dollar", options: ["Indian Rupees", "US Dollar", "British Pound Sterling","Italian Euro"])
                            InputForSettingsTypes(heading: "Bank Account Number", placeholder: "Enter Bank Account Number",keyboardType: .numberPad)
                            
                            InputForSettingsTypes(heading: "Payment Options", placeholder: "Enter payment Options ")
                            InputForSettingsTypes(heading: "Late Fee Policy", placeholder: "Enter Late Fee Policy")
                            
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

struct customDropDownCurrency: View {
    var heading: String
    var placeholder: String
    var currencyList: [String] = 
    ["AED: United Arab Emirates Dirham","AFN: Afghan Afghani","ALL: Albanian Lek","AMD: Armenian Dram","ANG: Netherlands Antillean Guilder","AOA: Angolan Kwanza","ARS: Argentine Peso","AUD: Australian Dollar","AWG: Aruban Florin","AZN: Azerbaijani Manat","BAM: Bosnia-Herzegovina Convertible","BBD: Barbadian Dollar","BDT: Bangladeshi Taka","BGN: Bulgarian Lev","BHD: Bahraini Dinar","BIF: Burundian Franc","BMD: Bermudian Dollar","BND: Brunei Dollar","BOB: Bolivian Boliviano","BRL: Brazilian Real","BSD: Bahamian Dollar","BTN: Bhutanese Ngultrum","BWP: Botswana Pula","BYN: Belarusian Ruble","BZD: Belize Dollar","CAD: Canadian Dollar","CDF: Congolese Franc","CHF: Swiss Franc","CLP: Chilean Peso","CNY: Chinese Yuan Renminbi","COP: Colombian Peso","CRC: Costa Rican Colón","CUP: Cuban Peso","CVE: Cape Verdean Escudo","CZK: Czech Koruna","DJF: Djiboutian Franc","DKK: Danish Krone","DOP: Dominican Peso","DZD: Algerian Dinar","EGP: Egyptian Pound","ERN: Eritrean Nakfa","ETB: Ethiopian Birr","EUR: Euro","FJD: Fijian Dollar","FKP: Falkland Islands Pound","GBP: British Pound Sterling","GEL: Georgian Lari","GGP: Guernsey Pound","GHS: Ghanaian Cedi","GIP: Gibraltar Pound","GMD: Gambian Dalasi","GNF: Guinean Franc","GTQ: Guatemalan Quetzal","GYD: Guyanese Dollar","HKD: Hong Kong Dollar","HNL: Honduran Lempira","HRK: Croatian Kuna","HTG: Haitian Gourde","HUF: Hungarian Forint","IDR: Indonesian Rupiah","ILS: Israeli New Shekel","IMP: Isle of Man Pound","INR: Indian Rupee","IQD: Iraqi Dinar","IRR: Iranian Rial","ISK: Icelandic Króna","JEP: Jersey Pound","JMD: Jamaican Dollar","JOD: Jordanian Dinar","JPY: Japanese Yen","KES: Kenyan Shilling","KGS: Kyrgyzstani Som","KHR: Cambodian Riel","KID: Kiribati Dollar","KMF: Comorian Franc","KRW: South Korean Won","KWD: Kuwaiti Dinar","KYD: Cayman Islands Dollar","KZT: Kazakhstani Tenge","LAK: Lao Kip","LBP: Lebanese Pound","LKR: Sri Lankan Rupee","LRD: Liberian Dollar","LSL: Lesotho Loti","LYD: Libyan Dinar","MAD: Moroccan Dirham","MDL: Moldovan Leu","MGA: Malagasy Ariary","MKD: Macedonian Denar","MMK: Myanmar Kyat","MNT: Mongolian Tögrög","MOP: Macanese Pataca","MRU: Mauritanian Ouguiya","MUR: Mauritian Rupee","MVR: Maldivian Rufiyaa","MWK: Malawian Kwacha","MXN: Mexican Peso","MYR: Malaysian Ringgit","MZN: Mozambican Metical","NAD: Namibian Dollar","NGN: Nigerian Naira","NIO: Nicaraguan Córdoba","NOK: Norwegian Krone","NPR: Nepalese Rupee","NZD: New Zealand Dollar","OMR: Omani Rial","PAB: Panamanian Balboa","PEN: Peruvian Sol","PGK: Papua New Guinean Kina","PHP: Philippine Peso","PKR: Pakistani Rupee","PLN: Polish Złoty","PYG: Paraguayan Guaraní","QAR: Qatari Riyal","RON: Romanian Leu","RSD: Serbian Dinar","RUB: Russian Ruble","RWF: Rwandan Franc","SAR: Saudi Riyal","SBD: Solomon Islands Dollar","SCR: Seychellois Rupee","SDG: Sudanese Pound","SEK: Swedish Krona","SGD: Singapore Dollar","SHP: Saint Helena Pound","SLE: Sierra Leonean Leone","SOS: Somali Shilling","SRD: Surinamese Dollar","SSP: South Sudanese Pound","STN: São Tomé and Príncipe Dobra","SYP: Syrian Pound","SZL: Eswatini Lilangeni","THB: Thai Baht","TJS: Tajikistani Somoni","TMT: Turkmenistani Manat","TND: Tunisian Dinar","TOP: Tongan Paʻanga","TRY: Turkish Lira","TTD: Trinidad and Tobago Dollar","TVD: Tuvaluan Dollar","TZS: Tanzanian Shilling","UAH: Ukrainian Hryvnia","UGX: Ugandan Shilling","USD: United States Dollar","UYU: Uruguayan Peso","UZS: Uzbekistani Soʻm","VES: Venezuelan Bolívar","VND: Vietnamese Đồng","VUV: Vanuatu Vatu","WST: Samoan Tālā","XAF: Central African CFA Franc","XCD: East Caribbean Dollar","XOF: West African CFA Franc","XPF: CFP Franc","YER: Yemeni Rial","ZAR: South African Rand","ZMW: Zambian Kwacha","ZWL:Zimbabwean Dollar"]

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
                            ForEach(currencyList, id: \.self) { country in
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
                                
                                if country != currencyList.last {
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
    PaymentTypeScreen()
}
