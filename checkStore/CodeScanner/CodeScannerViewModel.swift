//
//  CodeScannerViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 11/10/24.
//

import SwiftUI

class CodeScannerViewModel: ObservableObject {
    @Published var isPresentingScanner: Bool = false
    @Published var code: String = ""
    
    func activeScanner() {
        if isPresentingScanner {
            isPresentingScanner = false
        } else {
            isPresentingScanner = true
        }
    }
    
    func clearCode() {
        code = ""
    }
    
    func setCode(_ code: String) {
        if self.code.isEmpty {
            self.code = code
            print(self.code)
            activeScanner()
        }
    }
}
