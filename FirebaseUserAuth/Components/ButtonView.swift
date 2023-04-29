//
//  ButtonView.swift
//  FirebaseUserAuth
//
//  Created by Nick Pavlov on 4/29/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Image(systemName: image)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 48)
        .background(.blue)
        .cornerRadius(10)
        .padding()
        .padding(.top, 20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "", image: "")
    }
}
