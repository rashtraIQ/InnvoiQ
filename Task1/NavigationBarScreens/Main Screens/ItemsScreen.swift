//
//  ItemsScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 08/10/25.
//

import SwiftUI

struct Item: Identifiable, Equatable {
    let id = UUID()
    var srNo: Int
    var name: String
    var price: Double
    var unit: Int
}

struct ItemsScreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            ScrollView(){
                VStack(alignment:.leading){
                    Text("Add Items")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(Color(hex: "#37383B"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30)
                    ScrollView{
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.52)
                            VStack(alignment: .leading,spacing:0){
                                InputForSettingsTypes(heading: "Name", placeholder: "Enter Item Name")
                                InputForSettingsTypes(heading: "Price", placeholder: "Enter Price",keyboardType: .numberPad)
                                InputForSettingsTypes(heading: "Unit", placeholder: "Enter Unit",keyboardType: .numberPad)
                                    .padding(.bottom,15)
                                
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
                    
                VStack(alignment: .leading){
                        Text("List Of Items")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color(hex: "#37383B"))
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 30)
                        ItemTableView()
                    }
                    
                    
                }
                .padding(.top,30)
            }
        }
    }
}



struct ItemTableView: View {
    @State private var items: [Item] = [
        Item(srNo: 1, name: "new one 32", price: 6757.00, unit: 11),
        Item(srNo: 2, name: "Database Management", price: 2500.00, unit: 75),
        Item(srNo: 3, name: "Swift Course", price: 4999.00, unit: 20),
        Item(srNo: 4, name: "Web Development", price: 5999.45, unit: 30),
        Item(srNo: 5, name: "Python Course", price: 6999.77, unit: 90)
    ]
    
    @State private var selectedItem: Item? = nil
    @State private var showEditSheet = false
    @State private var activeMenuId: UUID? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                ScrollView(.horizontal) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Sr. No")
                                .frame(width: 70, alignment: .leading)
                            Text("Item Name")
                                .frame(width: 150, alignment: .leading)
                            Text("Price")
                                .frame(width: 100, alignment: .trailing)
                            Text("Unit")
                                .frame(width: 80, alignment: .trailing)
                            Text("Action")
                                .frame(width: 100, alignment: .trailing)
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .background(Color(hex: "F5F6FA"))
                        
                        Divider()
                        
                        ForEach(items) { item in
                            HStack {
                                Text("\(item.srNo)")
                                    .frame(width: 70, alignment: .leading)
                                Text(item.name)
                                    .frame(width: 150, alignment: .leading)
                                Text(String(format: "%.2f", item.price))
                                    .frame(width: 100, alignment: .trailing)
                                Text("\(item.unit)")
                                    .frame(width: 80, alignment: .trailing)
                                
                                // MARK: Dropdown Menu Below "Action" Title
                                //                                Menu {
                                //                                    Button {
                                //                                        selectedItem = item
                                //                                        showEditSheet = true
                                //                                    } label: {
                                //                                        Label("Edit", systemImage: "pencil")
                                //                                    }
                                //
                                //                                    Button(role: .destructive) {
                                //                                        deleteItem(item)
                                //                                    } label: {
                                //                                        Label("Delete", systemImage: "trash")
                                //                                    }
                                //                                } label: {
                                //                                    RoundedRectangle(cornerRadius: 10)
                                //                                        .fill(Color(hex: "528EFE"))
                                //                                        .frame(width: 80, height: 30)
                                //                                        .overlay {
                                //                                            Text("Action")
                                //                                                .foregroundStyle(.white)
                                //                                                .font(.system(size: 13, weight: .semibold))
                                //                                        }
                                //                                }
                                //                                .frame(width: 100, alignment: .trailing)
                                ZStack(alignment: .topTrailing) {
                                    // Action button
                                    Button {
                                        withAnimation {
                                            if activeMenuId == item.id {
                                                activeMenuId = nil
                                            } else {
                                                activeMenuId = item.id
                                            }
                                        }
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(hex: "528EFE"))
                                            .frame(width: 80, height: 30)
                                            .overlay {
                                                Text("Action")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 13, weight: .semibold))
                                            }
                                    }
                                    
                                    // MARK: Custom Dropdown
                                    if activeMenuId == item.id {
                                        VStack(spacing: 0) {
                                            Button {
                                                selectedItem = item
                                                showEditSheet = true
                                                activeMenuId = nil
                                            } label: {
                                                HStack {
                                                    Image(systemName: "pencil")
                                                    Text("Edit")
                                                }
                                                .frame(maxWidth: .infinity)
                                                .padding(.vertical, 6)
                                                .foregroundColor(.white)
                                            }
                                            
                                            Divider().background(Color.white.opacity(0.5))
                                            
                                            Button(role: .destructive) {
                                                deleteItem(item)
                                                activeMenuId = nil
                                            } label: {
                                                HStack {
                                                    Image(systemName: "trash")
                                                    Text("Delete")
                                                }
                                                .frame(maxWidth: .infinity)
                                                .padding(.vertical, 6)
                                                .foregroundColor(.white)
                                            }
                                        }
                                        .font(.system(size: 14))
                                        .frame(width: 110)
                                        .background(Color(hex: "528EFE"))
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
                                        .offset(y: 35) // Dropdown below button
                                    }
                                }
                                .frame(width: 100, alignment: .trailing)
                                
                            }
                            .font(.system(size: 15))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            Divider()
                        }
                    }
                    .background(Color.white)
                }
            }
            .frame(maxHeight: 200)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
        .padding()
        .sheet(isPresented: $showEditSheet) {
            if let selected = selectedItem {
                EditItemView(item: selected) { updatedItem in
                    updateItem(updatedItem)
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    private func deleteItem(_ item: Item) {
        items.removeAll { $0.id == item.id }
    }
    
    private func updateItem(_ updatedItem: Item) {
        if let index = items.firstIndex(where: { $0.id == updatedItem.id }) {
            items[index] = updatedItem
        }
    }
}




struct EditItemView: View {
    @Environment(\.dismiss) var dismiss
    @State var item: Item
    var onSave: (Item) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $item.name)
                TextField("Price", value: $item.price, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Unit", value: $item.unit, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Edit Item")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}



#Preview {
    ItemsScreen()
}




