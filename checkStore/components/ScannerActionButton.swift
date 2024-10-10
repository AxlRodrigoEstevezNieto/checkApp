//
//  ScannerActionButton.swift
//  checkStore
//
//  Created by Axl Estevez on 10/10/24.
//

import SwiftUI

struct ScannerActionButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "barcode")
                .resizable()
                .frame(width: 200, height: 150)
                .padding(.top, 16)
        }
    }
}

#Preview {
    ScannerActionButton()
}
