//  addInvoiceScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 27/10/25.

import SwiftUI
struct Invoice: Identifiable,Equatable{
    let id = UUID()
    var description: String
    var quantity: Int
    var price: Int
    var units: Int
}

struct addInvoiceScreen: View {
    @Binding var addInvoiceButtonPressed: Bool
    @State private var invoices: [Invoice] = [
        Invoice(description: "Website Design", quantity: 3, price: 2500, units: 10),
        Invoice(description: "Logo Design", quantity: 2, price: 1500, units: 5),
        Invoice(description: "App Development", quantity: 1, price: 9999, units: 1)
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Add Invoice")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color(hex: "37383B"))
                    
                    CustomInputType(heading: "Client Name", placeholder: "Enter Client Name")
                    CustomInputType(heading: "Client Address", placeholder: "Enter Client's Address", fieldHeight: 140)
                    CustomInputType(heading: "Client Number", placeholder: "Enter Client's Number", keyboardType: .numberPad)
                    CustomInputType(heading: "Client Email", placeholder: "Enter Client's Email", keyboardType: .emailAddress)
                    CustomDateInputType(heading: "Due Date", placeholder: "dd-mm-yyyy")
                    DropdownInputType(heading: "Payment Method", placeholder: "Credit Card", options: ["USD - United States Dollar", "EUR - Euro", "GBP - British Pound"])
                    CustomInputType(heading: "Payment Terms", placeholder: "Enter Payment Terms")
                    DropdownInputType(heading: "Currency", placeholder: "USD - United States Dollar", options: ["Credit Card", "Bank Transfer", "PayPal"])
                    CustomInputType(heading: "Note", placeholder: "Enter Note", fieldHeight: 140)
                    
                    FilterSearchBar(
                        heading: "List Of Items",
                        placeholder: "Search or add item",
                        options: ["Electronics", "Mobiles", "Laptops", "Headphones", "Watches", "Home Appliances", "Books", "Toys"]
                    ) { selectedItem in
                        let newInvoice = Invoice(description: selectedItem, quantity: 1, price: 500, units: 1)
                        invoices.append(newInvoice)
                    }
                    

                    InvoiceTableView(invoices: $invoices)
                    
                    HStack {
                        Button { } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(hex: "528EFE"))
                                .frame(width: 160, height: 40)
                                .overlay {
                                    Text("Save Details")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.white)
                                }
                        }
                        
                        Button { } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(hex: "F9AE86"))
                                .frame(width: 160, height: 40)
                                .overlay {
                                    Text("Preview")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.black)
                                }
                        }
                    }
                    .padding(.leading, 20)
                }
                .padding(.leading, 10)
            }
        }
    }
}
struct FlowLayout<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    var items: Data
    var content: (Data.Element) -> Content

    init(items: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.items = items
        self.content = content
    }

    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    content(item)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading) { d in
                            if (abs(width - d.width) > geometry.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if item == items.last! {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            if item == items.last! {
                                height = 0
                            }
                            return result
                        }
                }
            }
        }
        .frame(height: calculateHeight(for: items.count))
    }

    private func calculateHeight(for count: Int) -> CGFloat {
        return CGFloat(ceil(Double(count) / 3.0) * 40)
    }
}

struct InvoiceTableView: View {
    @Binding var invoices: [Invoice]
    
    @State private var selectedInvoice: Invoice? = nil
    @State private var showEditSheet = false
    @State private var activeMenuId: UUID? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                ScrollView(.horizontal) {
                    VStack(spacing: 0) {
                        HStack {
                            Text("Sr. No").frame(width: 70, alignment: .leading)
                            Text("Description").frame(width: 180, alignment: .leading)
                            Text("Quantity").frame(width: 100, alignment: .trailing)
                            Text("Price").frame(width: 100, alignment: .trailing)
                            Text("Units").frame(width: 100, alignment: .trailing)
                            Text("Action").frame(width: 100, alignment: .trailing)
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .background(Color(hex: "F5F6FA"))
                        
                        Divider()
                        
                        ForEach(Array(invoices.enumerated()), id: \.element.id) { index, invoice in
                            HStack {
                                Text("\(index + 1)").frame(width: 70, alignment: .leading)
                                Text(invoice.description).frame(width: 180, alignment: .leading)
                                Text("\(invoice.quantity)").frame(width: 100, alignment: .trailing)
                                Text("\(invoice.price)").frame(width: 100, alignment: .trailing)
                                Text("\(invoice.units)").frame(width: 100, alignment: .trailing)
                                
                                ZStack(alignment: .topTrailing) {
                                    Button {
                                        withAnimation {
                                            activeMenuId = (activeMenuId == invoice.id) ? nil : invoice.id
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
                                    
                                    if activeMenuId == invoice.id {
                                        VStack(spacing: 0) {
                                            Button {
                                                selectedInvoice = invoice
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
                                                invoices.removeAll { $0.id == invoice.id }
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
                                        .offset(y: 35)
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
            .frame(maxHeight: 250)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 2)
        .padding()
        .sheet(isPresented: $showEditSheet) {
            if let selected = selectedInvoice {
                EditInvoiceView(invoice: selected) { updatedInvoice in
                    if let index = invoices.firstIndex(where: { $0.id == updatedInvoice.id }) {
                        invoices[index] = updatedInvoice
                    }
                }
            }
        }
    }
}
struct EditInvoiceView: View {
    @Environment(\.dismiss) var dismiss
    @State var invoice: Invoice
    var onSave: (Invoice) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Description", text: $invoice.description)
                TextField("Quantity", value: $invoice.quantity, format: .number)
                    .keyboardType(.numberPad)
                TextField("Price", value: $invoice.price, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Units", value: $invoice.units, format: .number)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Edit Invoice")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(invoice)
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
struct FilterSearchBar: View {
    var heading: String
    var placeholder: String
    var options: [String]
    var onSelect: (String) -> Void
    
    @State private var allOptions: [String] = []
    @State private var searchText: String = ""
    @State private var isExpanded: Bool = false
    @State private var selectedOptions: [String] = []
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(heading)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(hex: "37383B"))
                .onAppear { allOptions = options }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 330, height: 46)
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(isFocused || isExpanded ? Color(hex: "528EFE") : Color(hex: "#BFC2D1"), lineWidth: 1.5)
                    )

                HStack {
                    TextField(placeholder, text: $searchText)
                        .padding(.horizontal, 15)
                        .font(.system(size: 14))
                        .disableAutocorrection(true)
                        .focused($isFocused)
                        .onTapGesture { withAnimation { isExpanded = true } }

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                        .padding(.trailing, 15)
                        .onTapGesture { withAnimation { isExpanded.toggle() } }
                }
            }
            
            if isExpanded {
                VStack(spacing: 0) {
                    let filteredOptions = allOptions.filter {
                        searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText)
                    }
                    
                    ForEach(filteredOptions, id: \.self) { option in
                        Button {
                            if !selectedOptions.contains(option) {
                                selectedOptions.append(option)
                                onSelect(option)
                            }
                            withAnimation { isExpanded = false }
                        } label: {
                            HStack {
                                Text(option)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                if selectedOptions.contains(option) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color(hex: "528EFE"))
                                }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                        }
                        Divider()
                    }
                }
                .frame(width: 330)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 3)
            }

            if !selectedOptions.isEmpty {
                FlowLayout(items: selectedOptions) { item in
                    HStack(spacing: 5) {
                        Text(item)
                        Image(systemName: "xmark.circle.fill")
                            .onTapGesture {
                                selectedOptions.removeAll { $0 == item }
                            }
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color(hex: "E9F1FF"))
                    .cornerRadius(8)
                }
                .padding(.top, 5)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct DropdownInputType: View {
    var heading: String
    var placeholder: String
    var options: [String]

    @State private var selectedOption: String = ""
    @State private var isExpanded: Bool = false
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(heading)
                .font(.system(size: 18, weight: .regular))
                .foregroundStyle(Color(hex: "37383B"))
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 330, height: 46)
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(isFocused || isExpanded ? Color(hex: "528EFE") : Color(hex: "#BFC2D1"), lineWidth: 1.5)
                    )

                HStack {
                    Text(selectedOption.isEmpty ? placeholder : selectedOption)
                        .foregroundStyle(selectedOption.isEmpty ? Color(hex: "94969E") : .black)
                        .padding(.leading, 15)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundStyle(Color.gray)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isExpanded.toggle()
                            }
                        }
                }
                .padding(.trailing, 20)
            }

            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedOption = option
                            isExpanded = false
                        }) {
                            Text(option)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .background(Color.white)
                                .foregroundColor(.black)
                        }
                        Divider()
                    }
                }
                .frame(width: 330)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 3)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(.horizontal, 20)
        .focused($isFocused)
    }
}

struct CustomDateInputType: View {
    var heading: String
    var placeholder: String
    var fieldHeight: CGFloat? = nil
    @State private var selectedDate: Date? = nil
    @State private var showDatePicker: Bool = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(heading)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color(hex: "37383B"))
                    .lineSpacing(12)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 330, height: fieldHeight ?? 46)
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(
                                showDatePicker
                                ? Color(hex: "528EFE")
                                : Color(hex: "#BFC2D1"),
                                lineWidth: 1.5
                            )
                            .overlay(
                                HStack {
                                    Text(selectedDate == nil
                                         ? placeholder
                                         : formattedDate(selectedDate!))
                                    .foregroundStyle(selectedDate == nil ? Color(hex: "94969E") : .black)
                                    .padding(.horizontal, 15)
                                    .onTapGesture {
                                        showDatePicker = true
                                    }

                                    Spacer()
                                    Image(systemName: "calendar")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 15)
                                        .onTapGesture {
                                            showDatePicker = true
                                        }
                                }
                            )
                    )
            }
            .padding(.horizontal, 20)
        }
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: Binding(
                        get: { selectedDate ?? Date() },
                        set: { newValue in selectedDate = newValue }
                    ),
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding()

                Button("Done") {
                    showDatePicker = false
                }
                .padding(.bottom, 10)
            }
            .presentationDetents([.medium])
        }
    }
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct CustomInputType: View {
    var heading: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    var fieldHeight : CGFloat? = nil
    @State private var text: String = ""
    @FocusState private var isFocused: Bool
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text(heading)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(Color(hex: "37383B"))
                    .lineSpacing(12)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 330, height: fieldHeight ?? 46)
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(isFocused ? Color(hex: "528EFE") : Color(hex: "#BFC2D1"), lineWidth: 1.5)
                            .overlay(
                                TextField(placeholder, text: $text)
                                    .keyboardType(keyboardType)
                                    .foregroundStyle(text.isEmpty ? Color(hex: "94969E") : .black)
                                    .padding(.horizontal, 15)
                                    .padding(.bottom, (fieldHeight ?? 46) > 46 ? 100 : 0)
                                    .focused($isFocused)
                            )
                    )
            }
            .padding(.horizontal,20)
        }
    }
}
#Preview {
    addInvoiceScreen(addInvoiceButtonPressed: .constant(true))
}
