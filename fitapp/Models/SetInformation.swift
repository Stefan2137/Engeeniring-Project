//
//  SetInformation.swift
//  fitapp
//
//  Created by Kuba Stefański on 20/12/2023.
//

import Foundation

struct SetInformation: Codable, Identifiable{
    let id: String
    let ExeName: String
    let setnumbers: Int
    let time: TimeInterval
    var isDone: Bool
    let numberreps: Int
    let weight: Double
    let WName: String

    
    
    mutating func setDone(_ state: Bool){
     isDone = state
    }
}
