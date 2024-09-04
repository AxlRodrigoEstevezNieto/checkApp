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
        router.getUserCollections(user: user!) { jsonResponse, error in
            handler(jsonResponse, error)
        }
    }
    
    func getProducts(rawData: [Any]) -> [String] {
        var productsName: [String] = []
        for data in rawData {
            let productObj = data as? [String:Any]
            let name = productObj?["nombre"] ?? String.empty
            productsName.append(name as! String)
        }
        return productsName
    }
}
