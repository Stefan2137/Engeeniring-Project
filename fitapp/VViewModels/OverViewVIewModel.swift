//
//  OverViewVIewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 16/01/2024.
//

import Foundation

class OverViewVIewModel: ObservableObject
{
    func forTrailingZero(_ temp: Double) -> String {
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
}
