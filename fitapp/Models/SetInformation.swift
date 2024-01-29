//
//  SetInformation.swift
//  fitapp
//
//  Created by Kuba Stefański on 20/12/2023.
//

import Foundation

struct SetInformation: Codable, Identifiable{
    let id: String
    let ExeName: [Int:String]
    let setnumbers: [Int:Int]
    let time: TimeInterval
    var isDone: Bool
    let numberreps: [Int:[Int]]
    let weight: [Int:[Double]]
    let WName: String

    
    
    mutating func setDone(_ state: Bool){
     isDone = state
    }
}
