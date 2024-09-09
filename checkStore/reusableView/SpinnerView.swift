//
//  SpinnerView.swift
//  checkStore
//
//  Created by Axl Estevez on 15/08/24.
//

import SwiftUI

struct SpinnerView: View {
    
    var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            ProgressView()
                .frame(width: 120, height: 50)
                .scaleEffect(3.0)
            
            Text(title)
                .padding(.top, 16)
                .foregroundStyle(.letters)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    SpinnerView(title: "Validando datos")
}
