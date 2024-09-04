//
//  LoginModel.swift
//  checkStore
//
//  Created by Axl Estevez on 22/08/24.
//

import Foundation

struct LoginModel: Codable {
    var user: UserModel
}

struct UserModel: Codable {
    var userName: String = String.emptyString
    var password: String = String.emptyString
}
