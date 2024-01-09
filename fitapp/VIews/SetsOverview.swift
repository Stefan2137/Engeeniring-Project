//
//  SetsOverview.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct SetsOverview: View {
    let item: String
    let exName: [String]
    var body: some View {
        NavigationView{
            VStack{
                
                Text(item)
                ForEach(exName, id: \.self) { exNames in
                    Text(exNames)
                }
                .navigationTitle(item)
            }
        }
    }
}
    
    
struct SetsOverview_Previews: PreviewProvider {
    static var previews: some View {
        SetsOverview(item: "Elo", exName: ["benc", "12"])
    }
}
