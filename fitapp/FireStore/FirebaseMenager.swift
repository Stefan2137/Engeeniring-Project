//
//  FirebaseMenager.swift
//  fitapp
//
//  Created by Kuba Stefański on 26/01/2024.
//

import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift
import FirebaseAuth

class FirebaseMenager {
    static let shared = FirebaseMenager()
    
    private init() {}
    private var uId: String {
            return Auth.auth().currentUser?.uid ?? ""
        }
    private let exeDB = Firestore.firestore().collection("cwiczenia")
    private var dbs: CollectionReference {
            return Firestore.firestore().collection("users/\(uId)/setsinfo")
        }
    
    
   
    private func workoutinfo(workoutId: String) -> DocumentReference {
        dbs.document(workoutId)
    }
    
    func getALLExeName() async throws -> [Exercise]
    {
        try await exeDB.getDocuments(as: Exercise.self)
    }
    func getAllExeSortedByName(descending:Bool) async throws -> [Exercise] {
        
        try await exeDB.order(by:"id" , descending: descending).getDocuments(as: Exercise.self)
    }
    func getAllExeSortedByMuscle(descending:Bool) async throws -> [Exercise] {
        
        try await exeDB.order(by:"Muscle_Group" , descending: descending).getDocuments(as: Exercise.self)
    }
    func getAllExeSortedByGrip(descending:Bool) async throws -> [Exercise] {
        
        try await exeDB.order(by:"Grip" , descending: descending).getDocuments(as: Exercise.self)
    }
    func getAllExeSortedByDiff(descending:Bool) async throws -> [Exercise] {
        
        try await exeDB.order(by:"Difficulty_Level" , descending: descending).getDocuments(as: Exercise.self)
    }
    
  //  func getallSetinfo(exercisename: String)async throws ->[SetInformation]{
    //    try await dbs
    //        .whereField(SetInformation.CodingKeys.ExeName.rawValue, isEqualTo: exercisename)
            
   // }
   
    
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
