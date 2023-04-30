//
//  ContentView.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
