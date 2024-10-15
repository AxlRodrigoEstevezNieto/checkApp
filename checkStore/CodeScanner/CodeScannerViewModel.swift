//
//  CodeScannerViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 11/10/24.
//

import SwiftUI

class CodeScannerViewModel: ObservableObject {
    @Published var isPresentingScanner: Bool = false
    
    func activeScanner() {
        if isPresentingScanner {
            isPresentingScanner = false
        } else {
            isPresentingScanner = true
        }
    }
}
