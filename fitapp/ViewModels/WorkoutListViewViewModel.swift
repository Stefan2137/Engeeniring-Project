//
//  SetsViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/10/2023.
//

import Foundation
import FirebaseFirestore

class SetsViewViewModel: ObservableObject {
    @Published var showingNewSetItemView = false
    @Published var EDate = Date()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete setinformation item
    /// - Parameter id: item id to delete
    func delete(id: String)
    {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("setsinfo")
            .document(id)
            .delete()
        
    }
}
