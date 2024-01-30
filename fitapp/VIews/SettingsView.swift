//
//  SettingsView.swift
//  fitapp
//
//  Created by Kuba Stefański on 18/10/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading Profile")
                    TLButton(title: "Log Out", background: .red, titlebackground: .white, action: {
                        viewModel.logOut()
                    })
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear()
        {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.green)
            .frame(width: 125, height: 125)
            .padding()
        VStack(alignment: .leading) {
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
       
        TLButton(title: "Log Out", background: .red, titlebackground: .white, action: {
            viewModel.logOut()
        })
        .frame(width: 300,height: 40)
        Spacer()
        
    }
}

struct SettingsView_Previews : PreviewProvider {
    static var previews: some View{
        SettingsView()
    }
}
