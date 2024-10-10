//
//  MenuFooter.swift
//  checkStore
//
//  Created by Axl Estevez on 10/10/24.
//

import SwiftUI

struct MenuFooter: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "house")
                    Text("Inicio")
                        .padding(.top, 5)
                }
            }
            .padding()
            
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "plus.app.fill")
                    Text("añadir productos")
                        .padding(.top, 5)
                }
            }
            .padding()
            
            Button(action: {
                
            }) {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                        .padding(.top, 5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MenuFooter()
}
