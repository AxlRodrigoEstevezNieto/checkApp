//
//  CustomSettings.swift
//  checkStore
//
//  Created by Axl Estevez on 02/09/24.
//

import SwiftUI

struct CustomSeachBarModifier: ViewModifier {
    var cancelButtonColor: UIColor
    
    func body(content: Content) -> some View {
        content
            .background()
    }
}

struct SearchBarColorModifier: UIViewRepresentable {
    var cancelButtonColor: UIColor
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func findSearchBar(in windows: [UIWindow]) -> UISearchBar? {
        for window in windows {
            if let seachBar = findSearchBar(in: window.rootViewController?.view) {
                return seachBar
            }
        }
        return nil
    }
    
    private func findSearchBar(in view: UIView?) -> UISearchBar? {
        guard let view = view else { return nil }
        for subview in view.subviews {
            if let searchBar = subview as? UISearchBar {
                return searchBar
            }
            
            if let searchBar = findSearchBar(in: subview) {
                return searchBar
            }
        }
        
        return nil
    }
}
