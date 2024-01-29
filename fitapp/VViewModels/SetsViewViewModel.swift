//
//  SetsViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 17/10/2023.
//

import Foundation

class SetsViewViewModel: ObservableObject {
    @Published var showingNewSetItemView = false
    @Published var showingCallendarView = false
    @Published var EDate = Date()
    init(){}
}
