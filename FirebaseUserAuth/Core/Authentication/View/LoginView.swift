//
//  LoginView.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var vm: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 220)
                    .padding(.vertical, 10)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@gmail.com")
                        .textInputAutocapitalization(.never)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sigm in button
                Button {
                    Task {
                        try await vm.signIn(withEmail: email, password: password)
                    }
                } label: {
                    ButtonView(title: "SIGN IN", image: "arrow.right")
                }
                .disabled(formIsValid)
                .opacity(formIsValid ? 1: 0.5)
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    RegistrationView()
                } label: {
                    Text("Don't have an account? **Sign up**")
                        .font(.system(size: 14))
                }
                
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
