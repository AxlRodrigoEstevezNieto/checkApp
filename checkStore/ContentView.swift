//
//  ContentView.swift
//  checkStore
//
//  Created by Axl Estevez on 22/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Iniciar sesión")
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.lettersGray, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 16)
                
                Button(action: {
                    print("Inicar sesión")
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
    ContentView()
}
