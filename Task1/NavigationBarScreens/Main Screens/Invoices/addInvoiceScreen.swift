//  addInvoiceScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 27/10/25.

import SwiftUI
import PDFKit

struct PDFViewer: UIViewRepresentable {
    let pdfData: Data

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = PDFDocument(data: pdfData)
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

import UIKit

struct PDFBuilder {
    static func generateInvoicePDF(
        client: addClient,
        invoices: [Invoice],
        totalAmount: Int
    ) -> Data {

        let pdfMetaData = [
            kCGPDFContextCreator: "InvoiQ App",
            kCGPDFContextAuthor: "Rashtra Humane",
            kCGPDFContextTitle: "Invoice Preview"
        ]

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]

        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

        let data = renderer.pdfData { context in
            context.beginPage()

            let titleFont = UIFont.boldSystemFont(ofSize: 24)
            let bodyFont = UIFont.systemFont(ofSize: 16)

            var yOffset: CGFloat = 40

            func drawText(_ text: String, font: UIFont, x: CGFloat, y: CGFloat) {
                let attributes: [NSAttributedString.Key: Any] = [.font: font]
                text.draw(at: CGPoint(x: x, y: y), withAttributes: attributes)
            }

            // Title
            drawText("Invoice", font: titleFont, x: 40, y: yOffset)
            yOffset += 40

            // Client Details
            drawText("Client Name: \(client.clientName)", font: bodyFont, x: 40, y: yOffset)
            yOffset += 25

            drawText("Address: \(client.clientAddress)", font: bodyFont, x: 40, y: yOffset)
            yOffset += 25

            drawText("Email: \(client.clientEmail)", font: bodyFont, x: 40, y: yOffset)
            yOffset += 25

            drawText("Phone: \(client.clientNumber)", font: bodyFont, x: 40, y: yOffset)
            yOffset += 40

            // Invoice Table Header
            drawText("Description", font: bodyFont, x: 40, y: yOffset)
            drawText("Qty", font: bodyFont, x: 220, y: yOffset)
            drawText("Price", font: bodyFont, x: 300, y: yOffset)
            drawText("Amount", font: bodyFont, x: 400, y: yOffset)
            yOffset += 20

            // Invoice Items
            for item in invoices {
                drawText(item.description, font: bodyFont, x: 40, y: yOffset)
                drawText("\(item.quantity)", font: bodyFont, x: 220, y: yOffset)
                drawText("$\(item.price)", font: bodyFont, x: 300, y: yOffset)
                drawText("$\(item.amount)", font: bodyFont, x: 400, y: yOffset)
                yOffset += 20
            }

            yOffset += 40

            // Total
            drawText("Total Amount: $\(totalAmount)", font: titleFont, x: 40, y: yOffset)
        }

        return data
    }
}



struct Invoice: Identifiable,Equatable{
    let id = UUID()
    // new items data
    var description: String
    var quantity: Int
    var price: Int
    var amount: Int {
        return price * quantity
    }
}

struct addClient: Identifiable,Equatable{
    let id = UUID()
    var clientName: String = ""
    var dateSelected: Date? = nil
    var status: Bool = false
    
    // extra information
    var clientAddress: String = ""
    var clientNumber: String = ""
    var clientEmail: String = ""
    var paymentMethod: String = "Credit Card"
    var paymentTerms: String = ""
    var currencyType: String = ""
    var note: String = ""
}


struct addInvoiceScreen: View {
    @State private var showPDF = false
    @State private var generatedPDF: Data? = nil
    @State var client = addClient()
    @State private var selectedItems: [String] = []
    @Binding var addInvoiceButtonPressed: Bool
    @State private var showAddItemPopup = false
    @State private var invoices: [Invoice] = []
    @State private var navigateToInvoices = false
    
    //    var onSave: ([Invoice]) -> Void // newly added
    var totalAmount: Int {
            invoices.reduce(0) { $0 + $1.amount }
    }
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "F5F5F9"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Add Invoice")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color(hex: "37383B"))
                        .padding(.leading,20)
                    
                    CustomInputType(heading: "Client Name", placeholder: "Enter Client Name", keyboardType: .default, text: $client.clientName)
                    
                    CustomInputType(heading: "Client Address", placeholder: "Enter Client's Address", keyboardType: .default, fieldHeight: 140, text: $client.clientAddress)
                    
                    CustomInputType(heading: "Client Number", placeholder: "Enter Client's Number",keyboardType: .numberPad, text: $client.clientNumber)
                    
                    CustomInputType(heading: "Client Email", placeholder: "Enter Client's Email", keyboardType: .emailAddress, text: $client.clientEmail)
                    
                    CustomDateInputType(heading: "Due Date", placeholder: "dd-mm-yyyy", selectedDate: $client.dateSelected)
                    
                    DropdownInputType(heading: "Payment Method", placeholder: "Credit Card", options: ["USD - United States Dollar", "EUR - Euro", "GBP - British Pound"])
                    
                    CustomInputType(heading: "Payment Terms", placeholder: "Enter Payment Terms",keyboardType: .default,text: $client.paymentTerms)
                    
                    DropdownInputType(heading: "Currency", placeholder: "USD - United States Dollar", options: ["Credit Card", "Bank Transfer", "PayPal"])
                    
                    CustomInputType(heading: "Note", placeholder: "Enter Note",keyboardType: .default,
                                    fieldHeight: 140, text: $client.note)
                    
                    FilterSearchBar(
                        heading: "List Of Items",
                        placeholder: "Search or add item",
                        options: ["API Development", "Domain & SSL Setup", "Technical Support", "AI Automation", "Freelance Work", "Web Development", "Qunatum Research"],
                        onSelect: { selectedItem in
                            let newInvoice = Invoice(description: selectedItem, quantity: 1, price: 500)
                            invoices.append(newInvoice)
                        },
                        selectedOptions: $selectedItems
                    )
                    .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("ShowAddItemPopup"))) { _ in
                        showAddItemPopup = true
                    }
                    
                    
                    
                    InvoiceTableView(invoices: $invoices)
                    
                    VStack{
                        HStack{
                            Text("Sub total (excl. Taxes) :")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundStyle(.gray)
                            
                            Rectangle()
                                .fill(Color(hex: "FFFFFF"))
                                .frame(width:120,height: 40)
                                .overlay {
                                    Text("$ \(totalAmount)")
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundStyle(Color(hex: "37383B"))
                                }
                            
                        }
                        //                        HStack{
                        //                            Text("Total Taxes :")
                        //                                .font(.system(size: 18, weight: .regular))
                        //                                .foregroundStyle(.gray)
                        //
                        //                            Rectangle()
                        //                                .fill(Color(hex: "FFFFFF"))
                        //                                .frame(width:120,height: 40)
                        //                                .overlay {
                        //                                    Text("$ \(totalAmt)")
                        //                                    .font(.system(size: 18, weight: .regular))
                        //                                    .foregroundStyle(Color(hex: "37383B"))
                        //                                }
                        //
                        //                        }
                    }
                    .padding(.leading, 20)
                    
                    HStack {
                        Button {
                            navigateToInvoices = true
                        } label: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(hex: "528EFE"))
                                .frame(width: 160, height: 40)
                                .overlay {
                                    Text("Save Details")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(.white)
                                }
                        }
                        
                        Button {
                            generatedPDF = PDFBuilder.generateInvoicePDF(
                            client: client,
                                invoices: invoices,
                                totalAmount: totalAmount
                            )
                            showPDF = true
                        } label: {
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
                    NavigationLink(
                        destination: InvoicesScreen2(client: $client, totalAmount: totalAmount),
                        isActive: $navigateToInvoices
                    ) { EmptyView() }
                }
                .padding(.leading, 10)
            }
            
            if showAddItemPopup {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { showAddItemPopup = false }
                AddNewItemPopup(isPresented: $showAddItemPopup, invoices: $invoices)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("NewItemAdded"))) { notification in
            if let newItem = notification.object as? String {
                selectedItems.append(newItem)
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showPDF) {
            if let pdfData = generatedPDF {
                PDFViewer(pdfData: pdfData)
            }
        }

        
    }
}
struct CustomDateInputType: View {
    var heading: String
    var placeholder: String
    var fieldHeight: CGFloat? = nil
    @Binding var selectedDate: Date?
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
    var keyboardType: UIKeyboardType
    var fieldHeight : CGFloat? = nil
    @Binding var text: String
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
                            Text("Amount").frame(width: 100, alignment: .trailing)
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
                                
                                Stepper(value: Binding(
                                    get: { invoices[index].quantity },
                                    set: { newValue in invoices[index].quantity = newValue }
                                ), in: 0...999) {
                                    Text("\(invoices[index].quantity)")
                                        .frame(width: 30)
                                }
                                .frame(width: 90,alignment: .center)
                                
                                Text("\(invoice.price)").frame(width: 100, alignment: .trailing)
                                
                                Text("\(invoice.amount)").frame(width: 100, alignment: .trailing)
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
                                                HStack {
                                                    Text("Action")
                                                    Image(systemName: "chevron.down")
                                                }
                                            .foregroundStyle(.white)
                                            .font(.system(size: 10, weight: .semibold))
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
                TextField("Amount", value: $invoice.price, format: .number)
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
    }}
struct FilterSearchBar: View {
    var heading: String
    var placeholder: String
    var options: [String]
    var onSelect: (String) -> Void
    @Binding var selectedOptions: [String]
    @State private var allOptions: [String] = []
    @State private var searchText: String = ""
    @State private var isExpanded: Bool = false
    //    @State private var selectedOptions: [String] = []
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
                        .onSubmit {
                            if !options.contains(where: { $0.localizedCaseInsensitiveCompare(searchText) == .orderedSame }) {
                                NotificationCenter.default.post(name: NSNotification.Name("ShowAddItemPopup"), object: nil)
                            }
                        }
                    
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
                            .foregroundStyle(Color.white)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.white)
                            .onTapGesture {
                                selectedOptions.removeAll { $0 == item }
                            }
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color(hex: "528EFE"))
                    .cornerRadius(8)
                }
                .padding(.top, 5)
            }
        }
        .padding(.horizontal, 20)
    }
}

// this is the origin

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




struct AddNewItemPopup: View {
    @Binding var isPresented: Bool
    @Binding var invoices: [Invoice]
    @State private var description: String = ""
    @State private var quantity: String = ""
    @State private var price: String = ""
    @State private var units: String = ""
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation { isPresented = false }
                }
            
            VStack(spacing: 15) {
                Text("Add New Item")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                TextField("Description", text: $description)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Quantity", text: $quantity)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                TextField("Units", text: $units)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                
                HStack {
                    Button("Cancel") {
                        withAnimation { isPresented = false }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    
                    Button("Add") {
                        let newInvoice = Invoice(
                            description: description,
                            quantity: Int(quantity) ?? 1,
                            price: Int(price) ?? 0,
                        )
                        invoices.append(newInvoice)
                        NotificationCenter.default.post(name: NSNotification.Name("NewItemAdded"), object: description)
                        withAnimation { isPresented = false }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "528EFE"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding()
            .frame(width: 320)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 10)
        }
        .animation(.easeInOut, value: isPresented)
    }
}

#Preview {
    addInvoiceScreen(addInvoiceButtonPressed: .constant(true))
}
