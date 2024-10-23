//
//  BarcodeScannerView.swift
//  checkStore
//
//  Created by Axl Estevez on 18/10/24.
//

import SwiftUI
import AVFoundation

struct BarcodeScannerView: View {
    @State private var captureSession: AVCaptureSession?
    @State private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var body: some View {
        ZStack {
            VideoCaptureView(captureSession: $captureSession, videoPreviewLayer: $videoPreviewLayer)
                .ignoresSafeArea(.all)
            BarcodeOverlay(captureSession: $captureSession)
                .ignoresSafeArea(.all)
        }
        .onAppear(perform: startSession)
    }
    
    private func startSession() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = UIScreen.main.bounds
            captureSession?.startRunning()
        } catch {
            print(error)
        }
    }
}

#Preview {
    BarcodeScannerView()
}
