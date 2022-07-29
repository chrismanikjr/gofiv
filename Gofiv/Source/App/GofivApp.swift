//
//  GofivApp.swift
//  Gofiv
//
//  Created by Chrismanto Natanail Manik on 26/07/22.
//

import SwiftUI
import Firebase
import GoogleSignIn
@main
struct GofivApp: App {
    @StateObject var viewModel = AuthenticationViewModel()
    let persistenceController = PersistenceController.shared
    init(){
        setupAuthentication()
    }

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            LoginView()
//                .environmentObject(viewModel)
            HomeView()
        }
    }
}

extension GofivApp{
    private func setupAuthentication(){
        FirebaseApp.configure()
    }
}
