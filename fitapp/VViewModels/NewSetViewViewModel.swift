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
  //  @Published var sets:[SetInformation] = []
    @Published var WorkoutName = ""
    @Published var title = ""
    @Published var numberofsets = 0
    @Published var setpause = Timer()
    @Published var date = Date()
    @Published var showAlert = false
    @Published var numberofreps = 0
    @Published var numberOfSetsAdded = 1
    @Published var weight1 = 0.0
    @Published var weightS = ""
    @Published var numberOfExercises = 1
    
    
    init(){}
    
    func save()
    {
        
        guard canSave else{
            return
        }
        weight1 = Double(weightS)!
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        let newId = UUID().uuidString
        let newSet = SetInformation(id: newId,
                                    ExeName: title,
                                    setnumbers: numberofsets,
                                    time: 0,
                                    isDone: false,
                                    numberreps: numberofreps,
                                    weight:weight1,
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
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard !weightS.isEmpty  else{
            return false
        }
        return true
    }
    func addSet(){
        numberOfSetsAdded += 1
    }
    func addExercise(){
        numberOfExercises += 1
    }
}
