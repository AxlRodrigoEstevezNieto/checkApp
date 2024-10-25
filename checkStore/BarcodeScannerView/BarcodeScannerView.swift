//
//  BarcodeScannerView.swift
//  checkStore
//
//  Created by Axl Estevez on 18/10/24.
//

import SwiftUI
import UIKit

struct BarcodeScannerView: UIViewControllerRepresentable {

    var onFoundBarcoe: (String) -> Void
    
    func makeUIViewController(context: Context) -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.didFindCode = { code in
            onFoundBarcoe(code)
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: BarcodeScannerViewController, context: Context) {
        
    }
}

