//
//  ExerciseInfromationView.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct ExerciseInfromationView: View {
    let info: String
    var body: some View {
        NavigationView{
            VStack {
                Text(info)
            }
                .navigationTitle(info)
        }
        
    }
}

struct ExerciseInfromationViewPreview: PreviewProvider{
    static var previews: some View{
        ExerciseInfromationView(info: "Elo Benc")
    }
}
