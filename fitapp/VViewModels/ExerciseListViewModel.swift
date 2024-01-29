//
//  ExerciseListViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/10/2023.

 import FirebaseFirestore
 import Foundation
 import FirebaseFirestoreSwift
 class ExerciseListViewViewModel: ObservableObject{
 @Published private(set) var exeName:[Exercise] = []
 @Published var sortOption: SortOption? = nil
 
 enum SortOption:String, CaseIterable{
     case name,diff,grip,muscle
 }
 
 func getallname() async throws
 {
     self.exeName = try await FirebaseMenager.shared.getALLExeName()
 }
 
 func filterselected(option:SortOption) async throws{
     switch option{
     case .name:
         self.exeName = try await FirebaseMenager.shared.getAllExeSortedByName(descending: false)
     case .diff:
         self.exeName = try await FirebaseMenager.shared.getAllExeSortedByDiff(descending: true)
     case.grip:
         self.exeName = try await FirebaseMenager.shared.getAllExeSortedByGrip(descending: true)
     case .muscle:
         self.exeName = try await FirebaseMenager.shared.getAllExeSortedByMuscle(descending: true)

     }
     self.sortOption = option
 }
 }

