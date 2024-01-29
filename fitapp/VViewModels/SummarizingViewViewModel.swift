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
        print(info)
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
    
 
    var matchingKey: Int? = nil
    let searchString = "Dumbbell Seated Scaption"
    var weights: [Double] = []
    var names: [String] = []
    var intervals: [TimeInterval] = []
    var matchingKeys: [Int] = []

    func search() {
        for (index, data) in info.enumerated() {
               for (key, value) in data.ExeName {
                   if value == searchString {
                       matchingKeys.append(key)

                       // Add entire weight array to the 'weights' array
                       if let weightArray = data.weight[key] {
                           weights.append(contentsOf: weightArray)
                       }

                       // Add name to the 'names' array
                       names.append(data.ExeName[key] ?? "")

                       // Add time to the 'intervals' array
                       intervals.append(data.time)

                       // Print the key and index in 'info' array
                       print("Key found in info[\(index)]: \(key)")
                   }
               }
           }

           if matchingKeys.isEmpty {
               print("Key not found for value: \(searchString)")
           }
        print("Matching Keys: \(matchingKeys)")
        print("Weights: \(weights)")
        print("Names: \(names)")
        print("Intervals: \(intervals)")
    }
}
