//
//  LoginView.swift
//  miSafety
//
//  Created by Michael Tayamen Satumba Jr. on 1/27/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error: String = ""
    var body: some View {
        VStack {
            HStack {
                Image("logonbg")
                    .resizable()
                    .frame(width: 300, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding(.top, 20)
                Spacer()
                Image("user")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                .padding(.bottom, 150)
                .padding(.trailing, 20)
            }
           
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: login) {
                Text("Login")
            }
            Text(error)
                .foregroundColor(.red)
        }
            }
    }
    func login() {
        if email.isEmpty || password.isEmpty {
            error = "Please fill in all fields"
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
                if let error = error {
                    print("Error creating user: \(error)")
                } else {
                    // Redirect to the Home view
                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: Home())
                }
            }
        }
    }
    

}
