import SwiftUI
import Firebase

struct ContentView: View {
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
                        Image("leader")
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
                        Button(action: register) {
                            Text("Register")
                        }
                        Text(error)
                            .foregroundColor(.red)
                        NavigationLink(destination: LoginView()) {
                            Text("Already have an account? Login here")
                        }
                    }
                }
            }

    func register() {
        if email.isEmpty || password.isEmpty {
            error = "Please fill in all fields"
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
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
