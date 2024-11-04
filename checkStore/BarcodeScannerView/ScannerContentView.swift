//
//  ScannerContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 24/10/24.
//

import SwiftUI

struct ScannerContentView: View {
    @ObservedObject var codeScannerViewModel: CodeScannerViewModel
    @StateObject var productDetailViewModel: ProductDetailViewModel
    @State private var scannedCode: String = "Escanea un código de barras"
    
    
    var body: some View {
        VStack {
            Text(scannedCode)
                .padding()
            
            BarcodeScannerView { code in
                if !code.isEmpty {
                    self.codeScannerViewModel.setCode(code)
                    self.codeScannerViewModel.activeScanner()
                    self.productDetailViewModel.detailPresing = true
                    self.productDetailViewModel.isLoadDetail = true
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ScannerContentView(codeScannerViewModel: CodeScannerViewModel(), productDetailViewModel: ProductDetailViewModel())
}
