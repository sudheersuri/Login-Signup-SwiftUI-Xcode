import SwiftUI

struct SignUp: View {
    
    @Binding var showingView: String
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Text("First Name")
                    .padding(.leading, 20)
                
                HStack {
                    Image(systemName: "person")
                    TextField("First Name", text: $firstName)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                Text("Last Name")
                    .padding(.leading, 20)
                    .padding(.top, 15)
                
                HStack {
                    Image(systemName: "person")
                    TextField("Last Name", text: $lastName)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                Text("Email")
                    .padding(.leading, 20)
                    .padding(.top, 15)
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                Text("Password")
                    .padding(.leading, 20)
                    .padding(.top, 15)
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    
                    Spacer()
                    
                    if password.count != 0 {
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                Button(action: {
                    // Perform signup logic here
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
                .padding(.top, 25)
                
                HStack {
                    Spacer()
                    Button(action: {
                        showingView = "login"
                    }) {
                        Text("Already have an account? Sign In")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 5)
                    
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
