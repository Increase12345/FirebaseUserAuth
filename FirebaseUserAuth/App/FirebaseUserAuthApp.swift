//
//  FirebaseUserAuthApp.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseUserAuthApp: App {
    @StateObject var vm = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
