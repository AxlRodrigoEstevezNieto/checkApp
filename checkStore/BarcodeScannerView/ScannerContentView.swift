//
//  ScannerContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 24/10/24.
//

import SwiftUI

struct ScannerContentView: View {
    @ObservedObject var codeScannerViewModel: CodeScannerViewModel
    @State private var scannedCode: String = "Escanea un código de barras"
    
    var body: some View {
        VStack {
            Text(scannedCode)
                .padding()
            
            BarcodeScannerView { code in
                self.codeScannerViewModel.setCode(code)
                
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ScannerContentView(codeScannerViewModel: CodeScannerViewModel())
}
