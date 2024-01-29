//
//  SetCardViewViewModel.swift
//  fitapp
//
//  Created by Kuba Stefański on 19/12/2023.
//

import Foundation
class SetCardViewViewModel: ObservableObject
{
    @Published var title = ""
    @Published var status = ""
    @Published var time = ""
    init(){}
}
