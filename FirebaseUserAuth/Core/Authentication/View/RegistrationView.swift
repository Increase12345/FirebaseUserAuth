//
//  RegistrationView.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            // image
            Image("icon")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.vertical, 10)
            
            // form fields
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@gmail.com")
                    .textInputAutocapitalization(.never)
                
                InputView(text: $fullName, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .bold()
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .bold()
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await vm.createUser(withEmail: email, password: password, fullName: fullName)
                }
            } label: {
                ButtonView(title: "SIGN UP", image: "arrow.right")
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1: 0.5)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Already have an account? **Sign in**")
                    .font(.system(size: 14))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
