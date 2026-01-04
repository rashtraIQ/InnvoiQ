//
//  InvoicesScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 08/10/25.
//

import SwiftUI
struct InvoicesModel: Codable,Identifiable {
    var customerName: String
    var dueDate: String
    let id: Int
    var invoicesDate: String
    var invoicesNote: String
    var invoicesNumber: String
    var invoicesStatus: String
    var total: String
}

class InvoicesViewModel : ObservableObject{
    init(){
        getInvoices()
    }
    @Published var invoices: [InvoicesModel] = []
    func getInvoices(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            guard error == nil else{
                print("Error Occurred")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Error no response")
                return
            }
            
            guard let newInvoices = try? JSONDecoder().decode([InvoicesModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.invoices = newInvoices
            }
        }
    }
}

struct InvoicesScreen: View {
    @StateObject var invoicesVM = InvoicesViewModel()
    @State private var showGridView1: Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 30){
                topView()
                searchBarInvoices()
                    .padding(.leading,20)
                cardViewInvoices(showGridView: $showGridView1)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                if invoicesVM.invoices.isEmpty {
                    if showGridView1 {
                        basicGridViewInvoices()
                    } else {
                        listViewInvoices()
                    }
                } else {
                    VStack {
                        ForEach(invoicesVM.invoices) { invoice in
                            invoicesAPIData(invoice: invoice)
                        }
                    }

                }
                
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
        }
    }
}



//#Preview {
//    InvoicesScreen()
//}
