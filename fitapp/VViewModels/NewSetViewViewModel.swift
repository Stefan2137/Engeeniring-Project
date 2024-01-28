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
    @Published var index = 0
    
    private var db = Firestore.firestore()
    init(){}
    
    func save()
    {
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        if let tit = title[index],
           let sets = numberofsets[index],
           let repss = numberofreps[index],
           let wei = weightS[index] {
            
            let exerciseInfo = ExerciseInfo(Name: tit, setnumbers: sets, numberreps: repss, weight: wei)
            
            
            
            let newSet = SetInformation(id: WorkoutName,
                                        ExeName:exerciseInfo,
                                        //setnumbers: numberofsets,
                                        time: date.timeIntervalSince1970,
                                        isDone: false
                                        //numberreps: numberofreps,
                                        //weight:weightS,
            )
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uId)
                .collection("setsinfo")
                .document(WorkoutName)
                .collection(UUID().uuidString)
                .document(tit)
                .setData(newSet.asDictionary())
            
        }
        
        var canSave: Bool{
            // guard !titlename.trimmingCharacters(in: .whitespaces).isEmpty else{
            //   return false
            // }
            // guard !weightS.isEmpty  else{
            ///   return false
            // }
            guard date >= Date().addingTimeInterval(-86400)else {
                return false
            }
            return true
        }
        func addExercise(){
            numberOfExercises += 1
        }
        
    }
    func updatecollection()
    {
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        if let tit = title[index],
           let sets = numberofsets[index],
           let repss = numberofreps[index],
           let wei = weightS[index] {
            
            let newSet = ExerciseInfo(Name: tit, setnumbers: sets, numberreps: repss, weight: wei)
            
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uId)
                .collection("setsinfo")
                .document(WorkoutName)
                .collection(UUID().uuidString)
                .document(tit)
                .setData(newSet.asDictionary())
        }
    }
}
