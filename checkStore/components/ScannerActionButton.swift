//
//  ScannerActionButton.swift
//  checkStore
//
//  Created by Axl Estevez on 10/10/24.
//

import SwiftUI

struct ScannerActionButton: View {
    var codeScannerViewModel: CodeScannerViewModel
    var body: some View {
        Button(action: {
            codeScannerViewModel.activeScanner()
        }) {
            VStack(alignment: .center) {
                Image(systemName: "barcode")
                    .resizable()
                    .frame(width: 200, height: 150)
                    .padding(.top, 16)
                    .foregroundStyle(Color.blueBackground)
                Text("Escanea el código de barras")
                    .foregroundStyle(Color.blueBackground)
            }
        }
    }
}

#Preview {
    ScannerActionButton(codeScannerViewModel: CodeScannerViewModel())
}
