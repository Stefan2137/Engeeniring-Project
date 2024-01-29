//
//  RegisterView.swift
//  fitapp
//
//  Created by Kuba Stefański on 16/11/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //Header
            HeaderView(tittle: "Register",
                       subtittle: "Start your Workout",
                       angel: -15,
                       backgroundcolor: .black)
            Form{
                TextField("Full Name",text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Adress",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                TLButton(title: "Create Account", background: .green, titlebackground:   .white)
                {
                    viewModel.register()
                }
                .padding()
            }
    
            .offset(y:-50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews : PreviewProvider {
    static var previews: some View{
        RegisterView()
    }
}
