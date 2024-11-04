//
//  ProductDetailContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 26/10/24.
//

import SwiftUI

struct ProductDetailContentView: View {
    
    @ObservedObject var productDetailViewModel: ProductDetailViewModel
    var barcodeProduct: String
    @State var producto = ProductModel()
    
    var body: some View {
        if productDetailViewModel.isLoadDetail {
            SpinnerView(title: "Obteniendo detalle")
                .onAppear {
                    productDetailViewModel.getProductDetail(idProduct: barcodeProduct) { jsonData, error in
                        if error == nil{
                            producto = productDetailViewModel.createProductFromJSON(json: jsonData ?? [:])
                            productDetailViewModel.isLoadDetail = false
                        }
                    }
                }
        } else {
            ProductDetailView(productoBiding: producto)
                .onDisappear{
                    productDetailViewModel.detailPresing = false
                }
        }
    }
}

#Preview {
    ProductDetailContentView(productDetailViewModel: ProductDetailViewModel(), barcodeProduct: String.empty)
}
