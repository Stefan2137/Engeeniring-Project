//
//  Summary.swift
//  fitapp
//
//  Created by Kuba Stefański on 29/01/2024.
//

import Foundation

struct Summary: Identifiable,Equatable
{
    let Name:String
    var weig:[Double]
    var interval:TimeInterval
    var formattedDay: Date {
            let date = Date(timeIntervalSince1970: interval)
            return date
        }
    var id = UUID().uuidString
}
