//
//  Login.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 26/07/22.
//

import SwiftUI
import AuthenticationServices
struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack{
            Spacer()
            
            Image("Logo")
                .resizable()
                .frame(width: Helper.screenSize.width * 0.22, height: Helper.screenSize.width * 0.22, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(Helper.screenSize.width * 0.22)
            
            Spacer()
            Text("Welcome to Gofiv")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(20)
            Text("Sign in to your Account")
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 50, bottom: 50, trailing: 50))
            Spacer()
            SignInWithApple()
                .frame(width: Helper.screenSize.width * 0.7, height: 45)
            
            GoogleSignInButton()
                .frame(width: Helper.screenSize.width * 0.72, height: 45)
                .onTapGesture {
                    viewModel.signIn()
                }
            
            Spacer(minLength: 150)
        }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
