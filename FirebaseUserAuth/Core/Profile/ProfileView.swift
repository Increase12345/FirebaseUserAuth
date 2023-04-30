//
//  ProfileView.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        if let user = vm.currentUser {
            List {
                Section {
                    HStack(spacing: 15) {
                        Text(user.initials)
                            .fontWeight(.semibold)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .font(.title2)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("ACCOUNT") {
                    Button {
                        vm.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                    }
                    
                    Button {
                        
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
