//
//  SetInformation.swift
//  fitapp
//
//  Created by Kuba Stefański on 20/12/2023.
//

import Foundation

struct SetInformation: Codable, Identifiable{
    let id: String
    let ExeName: ExerciseInfo
    let time: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool){
     isDone = state
    }
}

struct ExerciseInfo: Codable{
    let Name: String
    let setnumbers: Int
    let numberreps: [Int]
    let weight: [Double]
}


