//
//  ContentView.swift
//  LoginSignupSwiftUI
//
//  Created by Sudheer Suri on 2023-10-09.
//

import SwiftUI

struct ContentView: View {
    @State private var showingView: String = "login"
    
    var body: some View {
        VStack{
            if showingView == "login" {
                Login(showingView: $showingView)
            }
            else if showingView == "signup" {
                SignUp(showingView: $showingView)
            }
            else{
                Home(showingView: $showingView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
