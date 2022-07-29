//
//  SignInWithApple.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 27/07/22.
//

import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable{
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) ->  ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .continue, style: colorScheme == .dark ? .white : .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
    
}
