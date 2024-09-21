//
//  Utils.swift
//  checkStore
//
//  Created by Axl Estevez on 23/08/24.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct Utils {
    static func emailValidate(email: String) -> Bool {
        return false
    }
}
