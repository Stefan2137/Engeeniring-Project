//
//  LoginView.swift
//  fitapp
//
//  Created by Kuba Stefański on 12/11/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(tittle: "Workout",
                           subtittle: "Planner",
                           angel: 15,
                           backgroundcolor: Color.pink)
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    TLButton(title: "Login in", background: .blue,titlebackground: .white)
                    {
                        viewModel.login()
                        
                    }
                    
                    .padding()
                    .accessibility(identifier: "Login in")
                    
                }
                .offset(y: -50)
                //Create Account
                VStack{
                    Text("New Around here?")
                    
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
                
                Spacer()
            }
        }
    }
}


struct LoginView_Previews : PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}

