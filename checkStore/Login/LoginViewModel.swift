//
//  LoginViewModel.swift
//  checkStore
//
//  Created by Axl Estevez on 22/08/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var isSingIn: Bool = false
    @Published var isSuccess: Bool = false
    
    private let router = Router()
    
    func login(user: UserModel, handler: @escaping ResponseLoginHandler) {
        router.firebaseAuthLogin(user: user) { isLogin in
            self.saveStorageUser(isLogin, user: user.userName)
            handler(isLogin)
        }
    }
    
    private func saveStorageUser(_ isLoggin: Bool = false, user: String) {
        if isLoggin {
            UserDefaults.standard.set(user, forKey: "username")
        }
    }
}

