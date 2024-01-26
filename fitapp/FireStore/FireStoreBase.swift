//
//  FireStoreBase.swift
//  fitapp
//
//  Created by Kuba Stefański on 26/01/2024.
//

import Foundation
import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift

class FirebaseMenager {
    static let shared = FirebaseMenager()
    
    private init() {}
    
    private let exeDB = Firestore.firestore().collection("cwiczenia")
    
    func getALLExercises() async throws -> [Exercise]
    {
        let snapshot = try await exeDB.getDocuments()
        
        var exercises: [Exercise] = []
        
        for document in snapshot.documents {
            let exe = try document.data(as: Exercise.self)
            exercises.append(exe)
        }
        return exercises
    }
}
