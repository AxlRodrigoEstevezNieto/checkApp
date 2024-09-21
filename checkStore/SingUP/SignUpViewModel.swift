//
//  SignUpViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 08/09/24.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var isPresent: Bool = false
    
    private let router: Router = Router()
    
    func signupUser(user: UserModel) {
        let email = user.userName
        
        if Utils.emailValidate(email: email) {
            
        }
    }
}
