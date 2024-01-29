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
    var formattedDay: Int {
            let calendar = Calendar.current
            let date = Date(timeIntervalSince1970: interval)
            let day = calendar.component(.day, from: date)
            return day
        }
    var id = UUID().uuidString
    
}
