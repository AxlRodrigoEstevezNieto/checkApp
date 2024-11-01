//
//  ProductDetailView.swift
//  checkStore
//
//  Created by Axl Estevez on 26/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var producto = ProductModel()
    var productoBiding: ProductModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25){
            Image("detalleIcon")
                .resizable()
                .frame(width: 250, height: 250)
            HStack {
                Text("Código de barras:")
                Text(producto.barcode)
            }
            HStack {
                Text("Marca:")
                Text(producto.marca)
            }
            HStack {
                Text("Nombre del producto:")
                Text(producto.nombre)
            }
            HStack {
                Text("Precio:")
                Text(producto.precio)
            }

            HStack {
                Text("Presentación:")
                Text(producto.presentacion)
            }
            Spacer()
        }
        .onAppear{
            producto.barcode = productoBiding.barcode
            producto.marca = productoBiding.marca
            producto.nombre = productoBiding.nombre
            producto.precio = productoBiding.precio
            producto.presentacion = productoBiding.presentacion
        }
    }
}

#Preview {
    ProductDetailView(productoBiding: ProductModel())
}
