//
//  ApiRouter.swift
//  checkStore
//
//  Created by Axl Estevez on 22/08/24.
//

import Foundation
import Alamofire
import FirebaseAuth
import FirebaseFirestore

public typealias ResponseHandler = (_ jsonResponse: Any, _ urlResponse: URLResponse?) -> ()
public typealias ResponseFirestore = (_ jsonResponse: Any?, _ error: Error?) -> ()
public typealias ResponseLoginHandler = (_ isLogin: Bool) -> ()
public typealias ResponseSingInHandler = (_ isSuccess: Bool) -> ()

class Router {
    
    private let db = Firestore.firestore()
    
    func firebaseAuthLogin(user: UserModel, completionHanler: @escaping ResponseLoginHandler) {
        let userName = user.userName
        let password = user.password
        
        if (userName != String.empty) && (password != String.empty) {
            Auth.auth().signIn(withEmail: userName, password: password) { result, error in
                if let result = result, error == nil {
                    debugPrint(result.user.email ?? String.empty)
                    let isLogin = true
                    completionHanler(isLogin)
                } else {
                    let isLogin = false
                    completionHanler(isLogin)
                }
            }
        }
    }
     
    func firebaseAuthSingIn(user: UserModel, completionHanler: @escaping ResponseSingInHandler) {
        let userName = user.userName
        let password = user.password
        
        if (userName != String.empty) && (password != String.empty) {
            Auth.auth().createUser(withEmail: userName, password: password) { result, error in
                if let result = result, error == nil {
                    let isSuccess = true
                    debugPrint(result)
                    completionHanler(isSuccess)
                } else {
                    completionHanler(false)
                }
            }
        }
    }
}

// MARK: get products detail

extension Router {
    
    func getAllProductsUser(user: String, completionHandler: @escaping ResponseFirestore ) {
        db.collection("users").document(user).getDocument { (documentSnapshot, error) in
            if let document = documentSnapshot, error == nil {
                let productsDocument = document.value(forKey: "productos")
                let jsonResponse = document.data()!
                let errorResponse = error
                completionHandler(jsonResponse, error)
            } else {
                completionHandler((documentSnapshot?.data())!, error)
            }
        }
    }
    
    func getUserCollections(user: String, completionHandler: @escaping ResponseFirestore) {
        let userDocument = db.collection("users").document(user)
        
        userDocument.collection("productos").getDocuments { (querySnapshot, error)  in
            if let error = error {
                completionHandler(nil, error)
            } else {
                let documents = querySnapshot!.documents.map { document in
                    return document.data()
                }
                
                completionHandler(documents, nil)
            }
        }
    }
}
