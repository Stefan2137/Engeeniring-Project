//
//  fitappApp.swift
//  fitapp
//
//  Created by Kuba Stefański on 23/09/2023.
//
import FirebaseCore
import SwiftUI

@main
struct fitappApp: App {
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
