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
import Charts

class infoView:ObservableObject {
    
    @Published private(set) var info:[SetInformation] = []
    @Published private(set) var exeName:[Exercise] = []
    var sortOption: SortOption? = nil
    var weights: [Double] = []
    var names: String = ""
    var intervals: [TimeInterval] = []
    @Published var chartData:[Summary] = []
    
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
    
    
    func searchAndUpdate(searchString: String) {
           let sevenDaysInSeconds: TimeInterval = 7 * 24 * 60 * 60
           let currentDate = Date()
           let sevenDaysAgo = currentDate.addingTimeInterval(-sevenDaysInSeconds)
           
        for (_, data) in info.enumerated() {
               for (key, value) in data.ExeName {
                   if value == searchString {
                      
                       if let weightArray = data.weight[key], data.time > sevenDaysAgo.timeIntervalSince1970 {
                           let summary = Summary(Name: data.ExeName[key] ?? "",
                                                 weig: weightArray,
                                                 interval: data.time)
                           chartData.append(summary)
                           
                        
                        break
                       }
                   }
               }
           }
       }
    func forTrailingZero(_ temp: Double) -> String {
        var tempVar = String(format: "%g", temp)
        return tempVar
    }
}
