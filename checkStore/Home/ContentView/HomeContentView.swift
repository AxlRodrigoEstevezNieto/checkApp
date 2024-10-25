//
//  HomeContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 11/10/24.
//

import SwiftUI
import CodeScanner

struct HomeContentView: View {
    @ObservedObject var codeScannerViewModel: CodeScannerViewModel
    @State private var scannerCode: String = String.emptyString
    @State private var searchText: String = String.emptyString
    var items: [String]
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased())}
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack {
                VStack (alignment: .center) {
                    ScannerActionButton(codeScannerViewModel: codeScannerViewModel)
                        .sheet(isPresented: ($codeScannerViewModel.isPresentingScanner)) {
                            ScannerContentView(codeScannerViewModel: codeScannerViewModel)
                        }
                    
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
                MenuFooter()
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

