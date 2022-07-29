//
//  SwiftUIView.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 26/07/22.
//

import Firebase
import GoogleSignIn
class AuthenticationViewModel: ObservableObject{
    enum SignInState{
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut

    func signIn(){
        if GIDSignIn.sharedInstance.hasPreviousSignIn(){
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                self.authenticateUser(for: user, with: error)
            }
        }else{
            // 2
            guard let clientId = FirebaseApp.app()?.options.clientID else {return}
            
            //3
            let configuration = GIDConfiguration(clientID: clientId)
            
            //4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else{ return}
            guard let rootViewController = windowScene.windows.first?.rootViewController else {return}
            
            //5
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { user, error in
                self.authenticateUser(for: user, with: error)
            }
            
        }
    }
    
    func signOut() {
        // 1
        GIDSignIn.sharedInstance.signOut()
        
        do{
            //2
            try Auth.auth().signOut()
            state = .signedOut
        }catch{
            print(error.localizedDescription)
        }
    }
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?){
        ///1
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        ///2
        guard let authentication = user?.authentication, let idToken = authentication.idToken else {return}
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        ///3
        Auth.auth().signIn(with: credential) { _, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self.state = .signedIn
            }
        }
        
    }
}
