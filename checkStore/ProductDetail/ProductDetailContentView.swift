//
//  ProductDetailContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 26/10/24.
//

import SwiftUI

struct ProductDetailContentView: View {
    @Environment(\.dismiss) var dismiss
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
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        productDetailViewModel.detailPresing = false
                        dismiss()
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)

                    })
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                }
                ProductDetailView(productoBiding: producto)
                    .onDisappear{
                        productDetailViewModel.detailPresing = false
                    }
            }
        }
    }
}

#Preview {
    ProductDetailContentView(productDetailViewModel: ProductDetailViewModel(), barcodeProduct: String.empty)
}
