//
//  ClientScreen.swift
//  Task1
//
//  Created by Rashtra Humane on 07/10/25.
//

import SwiftUI
import Combine

struct ClientModel: Identifiable,Codable {
    let id: Int
    var name: String
    var email: String
    var address: String
    var contact: String
    var taxes: Tax
    var status: String
}
struct Tax: Codable {
    let taxID: Int
    let taxName: String
    let taxRate: String
}

class clientScreenViewModel: ObservableObject {
    @Published var clients: [ClientModel] = []
    var cancellables = Set<AnyCancellable>()
    init() {
        getClients()
    }
    func getClients(){
        guard let url = URL(string: "") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap {(data,response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [ClientModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                
            } receiveValue: { [weak self] (returnedClients) in
                self?.clients = returnedClients
            }
            .store(in: &cancellables)
    }
}

struct ClientScreen: View {
    @StateObject var clientsVM = clientScreenViewModel()
    @State private var showGridView1: Bool = true
    
    var body: some View {
        VStack(alignment: .leading,spacing: 30){
            if(clientsVM.clients.isEmpty){
                topView()
                searchBar()
                    .padding(.leading,20)
                cardView(showGridView: $showGridView1)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                if showGridView1 {
                    basicGridView()
                } else {
                    listView()
                }
                Spacer()
            } else{
                VStack {
                    ForEach(clientsVM.clients) { client in
                        clientAPIData(client: client)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}


//#Preview {
//    ClientScreen()
//}
