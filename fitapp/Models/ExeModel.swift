//
//  ExeModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 22/01/2024.
//

import Foundation

struct Exe: Identifiable , Codable, Hashable{
    var id: String = UUID().uuidString
    var Exercise_Name: String
}
