//
//  SetModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 02/01/2024.
//

import Foundation

struct SetModel: Identifiable {
       
        var id = UUID()
        var setNumber: Int
        var weight: Double
        var reps: Int
        var ExName: String
   }
