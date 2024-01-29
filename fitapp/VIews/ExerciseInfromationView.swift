//
//  ExerciseInfromationView.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct ExerciseInfromationView: View {
    let info: String
    let DiffLvL: String
    let Exercise_Classification: String
    let Grip: String
    let Muscle_Group: String
    let Posture: String
    let Primary_Equipment: String
    let Prime_Mover_Muscle: String
    let Secondary_Equipment: String
    let Secondary_Muscle: String
    let Short_Youtube_Demonstration: String
    let Single_Or_Double_Arm: String
    let Tertiary_Muscle: String
    
    var body: some View {
        NavigationView{
            VStack {
                Text(info)
                Text(Grip)
                if let url = URL(string: Short_Youtube_Demonstration) {
                                Link(destination: url) {
                                    Text("Watch Demonstration")
                                        .foregroundColor(.blue)
                                        .underline()
                                        .padding()
                                }
                            } else {
                                Text("No demonstration available")
                                    .foregroundColor(.gray)
                                    .padding()
                            }
            }
                .navigationTitle(info)
        }
        
    }
}

struct ExerciseInfromationViewPreview: PreviewProvider{
    static var previews: some View{
        ExerciseInfromationView(info: "XXDDD", DiffLvL: "XDXDx", Exercise_Classification: "xdxd", Grip: "xdxddxxd", Muscle_Group: "", Posture: "", Primary_Equipment: "", Prime_Mover_Muscle: "", Secondary_Equipment: "", Secondary_Muscle: "", Short_Youtube_Demonstration: "", Single_Or_Double_Arm: "", Tertiary_Muscle: "")
    }
}
