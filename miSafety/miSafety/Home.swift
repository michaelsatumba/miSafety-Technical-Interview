//
//  Home.swift
//  miSafety
//
//  Created by Michael Tayamen Satumba Jr. on 1/27/23.
//

import SwiftUI
import Firebase

struct Home: View {
    var body: some View {
        VStack {
            Text("Signed in!")
            Button(action: {
                try! Auth.auth().signOut()
                UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: LoginView())
            }) {
                Text("Logout")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


