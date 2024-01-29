//
//  ExerciseFieldViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 22/01/2024.
//

import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift
class ExerciseFieldViewModel: ObservableObject{
    @Published var exercises = [Exe]()
    private var dbe = Firestore.firestore()
    
    init()
    {
        fetchExe()
    }
    
    
    func fetchExe()
    {
        dbe.collection("cwiczenia").addSnapshotListener { (querySnapshot, error )in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            DispatchQueue.main.async{
                self.exercises = documents.compactMap { (queryDocumentSnapshot) -> Exe? in
                    let data = queryDocumentSnapshot.data()
                    
                    guard   let Exercise_Name = data["Exercise_Name"] as? String, !Exercise_Name.isEmpty else {
                        return nil
                    }
                    
                    
                    return Exe(Exercise_Name: Exercise_Name)
                    
                    
                }
            }
        }
    }
}
