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
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews : PreviewProvider {
    static var previews: some View{
        SettingsView()
    }
}
