//
//  ExerciseListViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/10/2023.
//
/*import FirebaseFirestore
 import Foundation
 import FirebaseFirestoreSwift
 class ExerciseListViewViewModel: ObservableObject{
 @Published var exercises = [Exercise]()
 private var db = Firestore.firestore()
 @Published var sortOption: SortOption = .name
 
 
 enum SortOption{
 case name,diff,grip,muscle
 }
 func fetchData() {
 db.collection("cwiczenia").addSnapshotListener { (querySnapshot, error )in
 
 guard let documencts = querySnapshot?.documents else {
 print("No documents")
 return
 }
 self.exercises = documencts.compactMap { (queryDocumentSnapshot) -> Exercise? in
 let data = queryDocumentSnapshot.data()
 
 guard   let Exercise_Name = data["Exercise_Name"] as? String, !Exercise_Name.isEmpty else {
 return nil
 }
 
 let Difficulty_Level = data["Difficulty_Level"] as? String ?? ""
 let Exercise_Classification = data["Exercise_Classification"] as? String ?? ""
 let Grip = data["Grip"] as? String ?? ""
 let Muscle_Group = data["Muscle_Group"] as? String ?? ""
 let Posture = data["Posture"] as? String ?? ""
 let Primary_Equipment = data["Primary_Equipment"] as? String ?? ""
 let Prime_Mover_Muscle = data["Prime_Mover_Muscle"] as? String ?? ""
 let Secondary_Equipment = data["Secondary_Equipment"] as? String ?? ""
 let Secondary_Muscle = data["Secondary_Muscle"] as? String ?? ""
 let Short_Youtube_Demonstration = data["Short_Youtube_Demonstration"] as? String ?? ""
 let Single_Or_Double_Arm = data["Single_Or_Double_Arm"] as? String ?? ""
 let Tertiary_Muscle = data["Tertiary_Muscle"] as? String ?? ""
 
 return Exercise(Exercise_Name: Exercise_Name,Difficulty_Level: Difficulty_Level,  Exercise_Classification: Exercise_Classification, Grip: Grip, Muscle_Group: Muscle_Group, Posture: Posture, Primary_Equipment: Primary_Equipment, Prime_Mover_Muscle: Prime_Mover_Muscle, Secondary_Equipment: Secondary_Equipment, Secondary_Muscle: Secondary_Muscle, Short_Youtube_Demonstration: Short_Youtube_Demonstration, Single_Or_Double_Arm: Single_Or_Double_Arm, Tertiary_Muscle: Tertiary_Muscle)
 
 
 }
 
 }
 }
 var sortedExercises: [Exercise]{
 switch sortOption{
 case .name:
 return exercises.sorted {$0.Exercise_Name < $1.Exercise_Name}
 case .diff:
 return exercises.sorted{$0.Difficulty_Level < $1.Difficulty_Level}
 case .grip:
 return exercises.sorted{$0.Grip < $1.Grip}
 case .muscle:
 return exercises.sorted{$0.Muscle_Group < $1.Muscle_Group}
 }
 }
 
 
 }
 */
