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
    @State private var spinerViewPresent: Bool = false
    @State private var isSignInView: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        if !spinerViewPresent && !isLoggedIn{
            loginView
        } else if !isLoggedIn && spinerViewPresent{
            SpinnerView(title: "Validando datos")
        } else if isLoggedIn && !spinerViewPresent {
            HomeView()
        } else if !isLoggedIn && !spinerViewPresent {
            Text("Fallo el inicio de sesión")
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
                        .textInputAutocapitalization(.never)
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
                    spinerViewPresent = true
                    let user = UserModel(userName: $username.wrappedValue, password: $password.wrappedValue)
                    viewModel.login(user: user) { isLogin in
                        if isLogin {
                            isLoggedIn = true
                            spinerViewPresent = false
                        } else {
                            isLoggedIn = false
                            spinerViewPresent = false
                        }
                    }
                }) {
                    Text("Iniciar sesión")
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(15.0)
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                HStack(alignment: .center) {
                    Text("¿Aun no tienes cuenta?")
                        .padding(.leading, 16)
                        .foregroundStyle(Color.grayFocus)
                    Button(action: {
                        isSignInView = true
                    }) {
                        Text("Registrate gratis")
                            .font(.headline)
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.top, 16)
            .onTapGesture {
                hideKeyboard()
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
