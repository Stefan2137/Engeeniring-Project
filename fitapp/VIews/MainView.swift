//
//  MainView.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSingedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            SetsView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "dumbbell")
                }
            ExerciseList()
                .tabItem{
                    Label("Lib", systemImage: "book.closed.fill")
                }
            BmiCalculator()
                .tabItem {
                    Label("Calc", systemImage: "building")
                }
            SummaryView()
                .tabItem {
                    Label("Summary" , systemImage: "calendar")
                }
            SettingsView()
                .tabItem {
                    Label("settings", systemImage: "gear")
                }
            
            
            
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View{
        MainView()
    }
}

