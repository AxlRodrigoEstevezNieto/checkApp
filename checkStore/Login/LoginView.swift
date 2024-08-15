//
//  LoginView.swift
//  checkStore
//
//  Created by Axl Estevez on 15/08/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var timeRemaining: Int = 5
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if isLoggedIn{
            SpinnerView()
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else if timeRemaining == 0 {
                        isLoggedIn = false
                    }
                }
        } else {
            loginView
        }
    }
    
    var loginView: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Inicia sesión")
                .font(.title2)
                .foregroundStyle(Color("letters", bundle: nil))
                .padding(.top, 16)
            
            Image(Constants.ImagesSourceName.loginImage, bundle: nil)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.top, 16)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Nombre de usuario")
                        .textCase(.none)
                        .font(.headline)
                        .foregroundStyle(.lettersGray)
                    
                    TextField("", text: $username)
                        .frame(height: 35)
                        .tint(.blue)
                        .padding([.leading, .trailing], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.lettersGray, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading) {
                    Text("Contraseña")
                        .textCase(.none)
                        .font(.headline)
                        .foregroundStyle(.lettersGray)
                    
                    SecureField("", text: $password)
                        .frame(height: 35)
                        .tint(.blue)
                        .padding([.leading, .trailing], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.lettersGray, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Iniciar sesión")
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(15.0)
                }
                .background(.white)
                .padding(.top, 16)
                .padding(.horizontal, 16)
            }
            .padding(.top, 16)
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
