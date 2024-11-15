//
//  ProductDetailViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 26/10/24.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var isLoadDetail: Bool = false
    @Published var onSuccessDetail: Bool = false
    @Published var detailPresing: Bool = false
    @Published var notProduct: Bool = false
    
    private let router = Router()
    
    func getProductDetail(idProduct: String, completionHandler: @escaping ProductoResponse) {
        router.getProduct(idProduct: idProduct) { jsonData, error in
            completionHandler(jsonData, error)
        }
    }
    
    func createProductFromJSON(json: [String:Any]) -> ProductModel {
        var newProduct = ProductModel()
        newProduct.barcode = json["barcode"] as? String ?? String.empty
        newProduct.marca = json["marca"] as? String ?? String.empty
        newProduct.nombre = json["nombre"] as? String ?? String.empty
        newProduct.precio = json["precio"] as? String ?? String.empty
        newProduct.presentacion = json["presentacion"] as? String ?? String.empty
        return newProduct
    }
}
