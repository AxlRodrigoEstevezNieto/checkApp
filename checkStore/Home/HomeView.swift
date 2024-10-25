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
    @State private var isLoadProducts: Bool = false
    @State private var isNotProducts: Bool = false
    @State var items: [String] = []
    @StateObject private var homeViewModel = HomeViewModel()
    @ObservedObject private var codeScannerViewModel = CodeScannerViewModel()
    
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
                        } else {
                            isNotProducts = true
                        }
                    }
                }
        } else {
            HomeContentView(codeScannerViewModel: codeScannerViewModel, items: items)
                .onAppear {
                    if (items.count < 1) && !isNotProducts {
                        isLoadProducts = true
                    }
                }
        }
    }
}

