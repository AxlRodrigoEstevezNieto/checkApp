//
//  BarcodeOverlay.swift
//  checkStore
//
//  Created by Axl Estevez on 18/10/24.
//

import SwiftUI
import AVFoundation

struct BarcodeOverlay: View {
    
    @Binding var captureSession: AVCaptureSession?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 300, height: 200)
                .overlay {
                    Text("Escanea el codigo de barras de tu producto")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
        }
        .background(Color.black.opacity(0.5))
        .cornerRadius(20)
        .onTapGesture {
            self.captureSession?.startRunning()
        }
        .onAppear {
            self.captureSession?.stopRunning()
        }
    }
}
