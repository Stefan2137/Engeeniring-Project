//
//  MainViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/10/2023.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSingedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
