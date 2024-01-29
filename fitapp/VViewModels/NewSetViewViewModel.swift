//
//  NewSetViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 20/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewSetViewViewModel: ObservableObject {
    @Published var WorkoutName = ""
    @Published var title = [0:""]
    @Published var numberofsets = [0:0]
    @Published var setpause = Timer()
    @Published var date = Date()
    @Published var showAlert = false
    @Published var numberofreps = [0:[0]]
    @Published var weightS = [0:[0.0]]
    @Published var numberOfExercises = 1
    @Published var titlename = ""
    
    
    init(){}
    
    func save()
    {
        
        guard canSave else{
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        let newId = UUID().uuidString
        let newSet = SetInformation(id: newId,
                                    ExeName: title,
                                    setnumbers: numberofsets,
                                    time: date.timeIntervalSince1970,
                                    isDone: false,
                                    numberreps: numberofreps,
                                    weight:weightS,
                                    WName: WorkoutName
                                    )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("setsinfo")
            .document(newId)
            .setData(newSet.asDictionary())
        
    }
    
    var canSave: Bool{
       // guard !titlename.trimmingCharacters(in: .whitespaces).isEmpty else{
         //   return false
       // }
        guard !weightS.isEmpty  else{
            return false
        }
        guard date >= Date().addingTimeInterval(-86400)else {
            return false
        }
        return true
    }
    func addExercise(){
        numberOfExercises += 1
    }
    
}
