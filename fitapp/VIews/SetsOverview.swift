//
//  SetsOverview.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct SetsOverview: View {
    let item: String
    var body: some View {
        Text(item)
    }
}

#Preview {
    SetsOverview(item: "Elo")
}
