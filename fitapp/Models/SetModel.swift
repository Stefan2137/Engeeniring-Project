//
//  SetModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 02/01/2024.
//

import Foundation

struct SetModel:Codable, Identifiable {
    let id: String
    let WName: String
    let Set:[SetInformation]
   }
