//
//  FirebaseMenager.swift
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
    
    private func workoutinfo(workoutId: String) -> DocumentReference {
        dbs.document(workoutId)
    }
    
    func getALLExeName() async throws -> [Exe]
    {
        let snapshot = try await exeDB.getDocuments()
        
        var exercises: [Exe] = []
        
        for document in snapshot.documents {
            let exer = try document.data(as: Exe.self)
            exercises.append(exer)
        }
        return exercises
    }
    
    private let dbs = Firestore.firestore().collection("users/UlGceoDOlTUvw2eWJCNUACbQu5b2/setsinfo")
    
    func getSetInfo(workoutId: String) async throws -> SetInformation {
        try await workoutinfo(workoutId: workoutId).getDocument(as: SetInformation.self)
    }
    
    func FetchData() async throws -> [SetInformation]
    {
        try await dbs.getDocuments(as: SetInformation.self)
    }
 
}

extension Query {
    
    func getDocuments<T>(as type: T.Type) async throws -> [T] where T : Decodable {
        let snapshot = try await self.getDocuments()
        
        return try snapshot.documents.map({document in
             try document.data(as: T.self)
        })
    }

}
