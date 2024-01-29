//
//  user.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/11/2023.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
