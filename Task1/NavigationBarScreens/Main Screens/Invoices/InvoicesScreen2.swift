//
//  InvoicesScreen2.swift
//  Task1
//
//  Created by Rashtra Humane on 10/11/25.
//

import SwiftUI

struct InvoicesScreen2: View {
    @Binding var client: addClient
    var totalAmount: Int
    @State private var showGridView1: Bool = false
    @State private var addInvoiceButtonisPressed: Bool = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                topView()
                searchBarInvoices()
                    .padding(.leading, 20)

                HStack {
                    Button {
                        addInvoiceButtonisPressed.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(hex: "528EFE"))
                            .frame(width: 109, height: 32)
                            .overlay {
                                HStack {
                                    Text("Add Invoice")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.white)
                                        .lineSpacing(12)
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(Color.white)
                                }
                            }
                    }
                    .padding(.leading, 20)

                    cardViewInvoices(showGridView: $showGridView1)
                        .padding(.horizontal, 20)
                }


                clientDetails(client: $client, totalAmt: totalAmount)

                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct clientDetails: View {
    @State private var selectedStatus: String = "Due"
    @Binding var client: addClient
    var totalAmt: Int
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.1))
            .frame(width: .infinity,height: 250)
            .overlay {
                VStack(spacing: 10){
                    HStack{
                        Text("Sr.No")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("1")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.black)
                        
                    }
                    HStack{
                        Text("Date")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        if let date = client.dateSelected{
                            Text("\(formattedDate(date))")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.black)
                        }
                            
                    }
                    HStack{
                        Text("Name")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(client.clientName)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    HStack{
                        Text("Amount")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("\(totalAmt)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    HStack{
                        Text("Status")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        CustomDropdown(selected: $selectedStatus)
                    }
                    HStack{
                        Text("Action")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.gray)
                        Spacer()
                        EditDropdownButton(client: $client)
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
    }
    private func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: date)
    }
}
struct EditDropdownButton: View {
    @Binding var client: addClient 
    @State private var isExpanded = false
    @State private var navigateToEdit = false

    var body: some View {
        ZStack {
            NavigationLink(
                destination: addInvoiceScreen(client: client, addInvoiceButtonPressed: .constant(false)),
                isActive: $navigateToEdit
            ) {
                EmptyView()
            }

            VStack(spacing: 0) {
                // Main Button
                Button {
                    withAnimation { isExpanded.toggle() }
                } label: {
                    HStack(spacing: 6) {
                        Text("Action")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.white)
                    }
                    .frame(width: 80, height: 35)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                }

                // Dropdown
                if isExpanded {
                    VStack(alignment: .leading, spacing: 0) {
                        Button {
                            withAnimation {
                                navigateToEdit = true
                                isExpanded = false
                            }
                        } label: {
                            HStack {
                                Text("Edit")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .frame(width: 100, alignment: .leading)
                            .background(Color(hex: "#528EFE"))
                            .cornerRadius(6)
                        }
                    }
                    .background(Color(hex: "#1F1F1F"))
                    .cornerRadius(8)
                    .shadow(radius: 5)
                    .offset(y: 5)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
        }
    }
}

struct CustomDropdown: View {
    @Binding var selected: String
    @State private var isExpanded = false
    @State private var showConfirmation = false
    @State private var pendingSelection: String? = nil
    
    let options = ["DUE", "RECEIVED"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Main Dropdown Button
            Button {
                withAnimation { isExpanded.toggle() }
            } label: {
                HStack {
                    Text(selected)
                        .foregroundColor(
                            selected == "DUE" ? .red :
                            (selected == "RECEIVED" ? .green : .black)
                        )
                        .font(.system(size: 14))
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 10)
                .frame(width: 120, height: 30)
                .background(Color(hex: "#F3F4F6"))
                .cornerRadius(6)
            }

            // Dropdown List
            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button {
                            if option == "RECEIVED" && selected != "RECEIVED" {
                                pendingSelection = option
                                showConfirmation = true
                            } else {
                                selected = option
                            }
                            withAnimation { isExpanded = false }
                        } label: {
                            Text(option)
                                .frame(width: 90)
                                .padding(8)
                                .background(selected == option ? Color(hex: "#528EFE").opacity(0.2) : Color.white)
                                .foregroundColor(.black)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(6)
                .shadow(radius: 3)
            }
        }
        .alert("Confirm Status Update", isPresented: $showConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Yes, Change") {
                if let pending = pendingSelection {
                    selected = pending
                }
            }
        } message: {
            Text("Are you sure you want to change the status?")
        }
    }
}



#Preview {
    @State var dummyClient = addClient(
            clientName: "John Doe",
            dateSelected: Date(),
            status: false,
            clientAddress: "123 Swift Street",
            clientNumber: "+91 9876543210",
            clientEmail: "john@example.com",
            paymentMethod: "Credit Card"
        )
    InvoicesScreen2(client: $dummyClient, totalAmount: 5000)
    
}
