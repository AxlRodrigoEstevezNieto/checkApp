//
//  HomeViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 03/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var isLoadProducts: Bool = false
    @Published var isOnSuscess: Bool = false
    
    private let router = Router()
    
    func getProductsUser(handler: @escaping ResponseFirestore) {
        let user = UserDefaults.standard.string(forKey: "username")
        router.getUserProducts(user: user!) { jsonResponse, error in
            handler(jsonResponse, error)
        }
    }
    
    func getProducts(rawData: [Any]) -> [ProductModel] {
        var productsList: [ProductModel] = []
        for data in rawData {
            let json = data as? [String:Any]
            var newProduct = ProductModel()
            newProduct.barcode = json?["barcode"] as! String
            newProduct.marca = json?["marca"] as! String
            newProduct.nombre = json?["nombre"] as! String
            newProduct.precio = json?["precio"] as! String
            newProduct.presentacion = json?["presentacion"] as! String
            productsList.append(newProduct)
        }
        return productsList
    }
}
