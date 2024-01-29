//
//  SummarizingViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 24/01/2024.
//

import FirebaseFirestore
import Foundation
import FirebaseFirestoreSwift
import FirebaseAuth

class infoView:ObservableObject {
    
    @Published private(set) var info:[SetInformation] = []
    @Published private(set) var exeName:[Exercise] = []
    @Published var sortOption: SortOption? = nil
    
    enum SortOption:String, CaseIterable{
        case name,diff,grip,muscle
    }
    
    func getallsets() async throws
    {
        self.info = try await  FirebaseMenager.shared.FetchData()
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
   
    func searchFor() {
        guard let uId = Auth.auth().currentUser?.uid else {
            print("User not authenticated")
            return
        }

        let valueToSearchFor = "Dumbbell Seated Scaption"
        let myCollRef = Firestore.firestore().collection("users/\(uId)/setsinfo")

        let query = myCollRef.whereField("ExeName", arrayContains: valueToSearchFor).limit(to: 1)

        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let document = querySnapshot?.documents.first {
                    let theData = document.data()

                    if let position = (theData["ExeName"] as? [String])?.firstIndex(of: valueToSearchFor) {
                        if let numberRepsArray = theData["weight"] as? [Double], position < numberRepsArray.count {
                            let numberOfReps = numberRepsArray[position]
                            print("Number of reps:", numberOfReps)
                        }
                    } else {
                        print("Search term not found in 'ExeName' field")
                    }
                } else {
                    print("No documents found")
                }
            }
        }
    }

    
    
    
}


