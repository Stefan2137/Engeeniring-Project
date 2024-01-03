//
//  Exercise.swift
//  fitapp
//
//  Created by Kuba Stefański on 22/11/2023.
//

import Foundation

struct Exercise: Identifiable , Codable{
    var id: String = UUID().uuidString
    var Difficulty_Level: String
    var Exercise_Name: String
    var Exercise_Classification: String
    var Grip: String
    var Muscle_Group: String
    var Posture: String
    var Primary_Equipment: String
    var Prime_Mover_Muscle: String
    var Secondary_Equipment: String
    var Secondary_Muscle: String
    var Short_Youtube_Demonstration: String
    var Single_Or_Double_Arm: String
    var Tertiary_Muscle: String
    
}
