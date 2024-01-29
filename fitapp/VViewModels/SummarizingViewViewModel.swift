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
    var weights: [Double] = []
    var names: String = ""
    var intervals: [TimeInterval] = []
    var matchingKeys: [Int] = []
    
    func search(searchString: String) {
        let sevenDaysInSeconds: TimeInterval = 7 * 24 * 60 * 60 // 7 days in seconds
        let currentDate = Date()
        let sevenDaysAgo = currentDate.addingTimeInterval(-sevenDaysInSeconds)
        
        for (index, data) in info.enumerated() {
            var found = false // Flag to indicate if a match is found for the current 'data'
            
            for (key, value) in data.ExeName {
                guard value == searchString else {
                    continue
                }
                
                // Check if the time interval is within the last 7 days
                if let weightArray = data.weight[key], data.time > sevenDaysAgo.timeIntervalSince1970 {
                    weights.append(contentsOf: weightArray)
                    names = data.ExeName[key] ?? ""
                    intervals.append(data.time)
                    
                    print("Key found in info[\(index)]: \(key)")
                    found = true
                    break // Break out of the inner loop once a match is found
                }
            }
        }
        
        print("Weights: \(weights)")
        print("Names: \(names)")
        print("Intervals: \(intervals)")
    }
}
