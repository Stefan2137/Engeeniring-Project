//
//  ExerciseInfromationView.swift
//  fitapp
//
//  Created by Kuba Stefański on 03/01/2024.
//

import SwiftUI

struct ExerciseInfromationView: View {
    let info: String?
    let DiffLvL: String?
    let Exercise_Classification: String?
    let Grip: String?
    let Muscle_Group: String?
    let Posture: String?
    let Primary_Equipment: String?
    let Prime_Mover_Muscle: String?
    let Secondary_Equipment: String?
    let Secondary_Muscle: String?
    let Short_Youtube_Demonstration: String
    let Single_Or_Double_Arm: String?
    let Tertiary_Muscle: String?
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    Section(header: Text("Main Exercise Information"))
                    {
                                    if let info = info {
                                        Text("Execrise Name:")
                                            .font(.headline)
                                            Text(info)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                                    
                                    if let diffLvL = DiffLvL {
                                        Text("Difficulty:")
                                            .font(.headline)
                                        Text(diffLvL)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                                    if let grip = Grip {
                                        Text("Grip Type:")
                                            .font(.headline)
                                        Text(grip)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                                    if let exerciseClassification = Exercise_Classification {
                                        Text("Classification:")
                                            .font(.headline)
                                        Text(exerciseClassification)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                                    if let posture = Posture {
                                        Text("Posture Information")
                                            .font(.headline)
                                        Text(posture)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                    }
                    Section(header: Text("Muscle Information"))
                    {
                        if let muscleGroup = Muscle_Group {
                                        Text("Muscle Group")
                                        .font(.headline)
                                       Text(muscleGroup)
                                        .padding(.vertical ,-20)
                                        .listRowSeparator(.hidden)
                                   }
                                   if let primeMoverMuscle = Prime_Mover_Muscle {
                                       Text("Prrimary Mover Muscle:")
                                           .font(.headline)
                                       Text(primeMoverMuscle)
                                           .padding(.vertical ,-20)
                                           .listRowSeparator(.hidden)
                                   }
                                   if let secondaryMuscle = Secondary_Muscle {
                                       Text("Secondary Muscle:")
                                           .font(.headline)
                                       Text(secondaryMuscle)
                                           .padding(.vertical ,-20)
                                           .listRowSeparator(.hidden)
                                   }
                                   if let tertiaryMuscle = Tertiary_Muscle {
                                       Text("Teritiary Muscle:")
                                           .font(.headline)
                                       Text(tertiaryMuscle)
                                           .padding(.vertical ,-20)
                                           .listRowSeparator(.hidden)
                                   }
                    }
                    Section(header: Text("Equipment") ){
                                    if let primaryEquipment = Primary_Equipment {
                                        Text("Main Equipment:")
                                            .font(.headline)
                                        Text(primaryEquipment)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
                                    if let secondaryEquipment = Secondary_Equipment {
                                        Text("Secondary Equipment:")
                                            .font(.headline)
                                        Text(secondaryEquipment)
                                            .padding(.vertical ,-20)
                                            .listRowSeparator(.hidden)
                                    }
}
                }
                .listStyle(GroupedListStyle())
                Spacer()
                Text("Short Youtube Demonstration")
                    .font(.headline)
                    .offset(y: 10)
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
                .navigationTitle("Exercise Details")
        }
        
    }
}

struct ExerciseInfromationViewPreview: PreviewProvider{
    static var previews: some View{
        ExerciseInfromationView(info: "Info", DiffLvL: "Difficulty LVL", Exercise_Classification: "Classification", Grip: "Grip", Muscle_Group: "Muscle_Group", Posture: "Posture", Primary_Equipment: "PrimeEqu", Prime_Mover_Muscle: "PrimeMover", Secondary_Equipment: "SecondEqu", Secondary_Muscle: "SecondaryMuscle", Short_Youtube_Demonstration: "", Single_Or_Double_Arm: "Single or double arm", Tertiary_Muscle: "TertiaryMuscle")
    }
}
