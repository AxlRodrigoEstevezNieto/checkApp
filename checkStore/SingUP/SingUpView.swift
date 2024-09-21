//
//  SingInView.swift
//  checkStore
//
//  Created by Axl Estevez on 23/08/24.
//

import SwiftUI

struct SingUPView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var spinerViewPresent: Bool = false
    @State private var timeRemaining: Int = 5
    @State private var isSignInView: Bool = false
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        if !spinerViewPresent && !isLoggedIn {
            singInView
        } else if !isLoggedIn && spinerViewPresent{
            SpinnerView(title: "validando Datos")
        } else if isLoggedIn && !spinerViewPresent {
            HomeView()
        } else if !isLoggedIn && !spinerViewPresent {
            Text("Fallo el inicio de sesión")
        }
    }
    
    var singInView: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Registrate")
                .font(.title2)
                .foregroundStyle(Color("letters", bundle: nil))
                .padding(.top, 16)
            
            Image(systemName: "person.crop.circle.fill.badge.plus")
                .resizable()
                .frame(width: 175, height: 150)
                .padding(.top, 16)
                .foregroundStyle(Color.blue)

            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Correo electrónico")
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
                    spinerViewPresent = true
                    let user = UserModel(userName: $username.wrappedValue, password: $password.wrappedValue)
                    loginViewModel.login(user: user) { isLogin in
                        if isLogin {
                            isLoggedIn = true
                            spinerViewPresent = false
                        } else {
                            isLoggedIn = false
                            spinerViewPresent = false
                        }
                    }
                }) {
                    Text("Registrarse")
                        .frame(height: 35)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(15.0)
                }
                .background(.white)
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                HStack(alignment: .center) {
                    Text("¿Ya tienes cuenta?")
                        .padding(.leading, 16)
                        .foregroundStyle(Color.grayFocus)
                    Button(action: {
                        loginViewModel.isSingIn = true
                    }) {
                        Text("Iniciar sesión")
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
    SingUPView(loginViewModel: LoginViewModel())
}
