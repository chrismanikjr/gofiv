//
//  SwiftUIView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 27/07/22.
//

import SwiftUI
import GoogleSignIn
struct GoogleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    private var button = GIDSignInButton()
    
    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .light: .dark
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        button.colorScheme = colorScheme == .dark ? .light : .dark
    }
}


