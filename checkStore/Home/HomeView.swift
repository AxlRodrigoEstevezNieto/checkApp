//
//  HomeView.swift
//  checkStore
//
//  Created by Axl Estevez on 23/08/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isHomeViewPresent: Bool = true
    @State private var isProductListViewPresent: Bool = false
    @State private var isProfileViewPresent: Bool = false
    @State private var searchText: String = String.emptyString
    @State private var isLoadProducts: Bool = true
    @StateObject private var homeViewModel = HomeViewModel()
    @State var items: [String] = []
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased())}
        }
    }
    
    var body: some View {
        if isLoadProducts {
            SpinnerView(title: "obteniendo productos")
                .onAppear {
                    homeViewModel.getProductsUser { jsonResponse, error in
                        if error == nil {
                            isLoadProducts = false
                            let data = jsonResponse as? [Any]
                            let productos = homeViewModel.getProducts(rawData: data!)
                            self.items = productos
                        }
                    }
                }
        } else {
            homeViewContent
        }
    }
    
    var homeViewContent: some View {
        NavigationSplitView {
            VStack {
                VStack (alignment: .center) {
                    Image(systemName: "barcode")
                        .resizable()
                        .frame(width: 200, height: 150)
                        .padding(.top, 16)
                    
                    List(filteredItems, id: \.self) { item in
                        NavigationLink {
                            Text("En construcción ...")
                        } label:{
                            Button(action: {
                                
                            }, label: {
                                    Text(item)
                            })
                        }
                        }
                    .searchable(text: $searchText, prompt: "Buscar produtos")
                    .onAppear {
                        customizeSearchBarCancelButton()
                    }
                }
                Spacer()
                HStack {
                    Button(action: {
                        
                    }) {
                        VStack {
                            Image(systemName: "house")
                            Text("Inicio")
                                .padding(.top, 5)
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        
                    }) {
                        VStack {
                            Image(systemName: "plus.app.fill")
                            Text("añadir productos")
                                .padding(.top, 5)
                        }
                    }
                    .padding()
                    
                    Button(action: {
                        
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Perfil")
                                .padding(.top, 5)
                        }
                    }
                    .padding()
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.blueBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Inicio")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            
        }
    }
    
    func customizeSearchBarCancelButton() {
        let apparance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        apparance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
}

#Preview {
    HomeView()
}
