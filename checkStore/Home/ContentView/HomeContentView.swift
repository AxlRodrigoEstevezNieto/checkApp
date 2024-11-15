//
//  HomeContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 11/10/24.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject var codeScannerViewModel: CodeScannerViewModel
    @StateObject var productDetailViewModel = ProductDetailViewModel()
    @State private var scannerCode: String = String.emptyString
    @State private var searchText: String = String.emptyString
    @State private var productSelected: ProductModel = ProductModel()
    var items: [ProductModel]
    
    var productNameItems: [String]{
        return items.map { $0.nombre }
    }
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return productNameItems
        } else {
            return productNameItems.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack {
                VStack (alignment: .center) {
                    ScannerActionButton(codeScannerViewModel: codeScannerViewModel)
                    List(filteredItems, id: \.self) { item in
                        NavigationLink {
                            ProductDetailView(productoBiding: searchProductDetail(productName: item))
                        } label:{
                            Button(action: {
                                print("INIT NAVIGATIONLINK")
                            }, label: {
                                Text(item)
                            })
                        }
                    }
                    .searchable(text: $searchText, prompt: "Buscar produtos")
                    .navigationTitle("Inicio")
                    .onAppear {
                        customizeSearchBarCancelButton()
                    }
                }
                Spacer()
                MenuFooter()
            }
            .sheet(isPresented: ($codeScannerViewModel.isPresentingScanner)) {
                ScannerContentView(
                    codeScannerViewModel: codeScannerViewModel,
                    productDetailViewModel: productDetailViewModel
                )
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
        .fullScreenCover(isPresented: $productDetailViewModel.detailPresing, content: {
            ProductDetailContentView(
                productDetailViewModel: self.productDetailViewModel,
                barcodeProduct: codeScannerViewModel.code
            )
        })
        .alert(
            Text("Producto no encontrado"),
            isPresented: $productDetailViewModel.isLoadDetail) {
                Button("Aceptar") {
                    self.productDetailViewModel.isLoadDetail = false
                }
            }
    }
    
    func customizeSearchBarCancelButton() {
        let apparance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        apparance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    func searchProductDetail(productName: String) -> ProductModel {
        var productFind = ProductModel()
        for product in items {
            if product.nombre == productName{
                productFind = product
                break
            }
        }
        return productFind
    }
}

