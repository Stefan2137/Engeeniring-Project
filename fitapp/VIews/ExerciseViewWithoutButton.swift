//
//  ExerciseField.swift
//  fitapp
//
//  Created by Kuba Stefański on 07/01/2024.
//

import SwiftUI

struct ExerciseFieldWithoutButton: View {
    @EnvironmentObject var viewModel: NewSetViewViewModel
    let index: Int
    let weight: String
    let reps: Int
    
    
    var body: some View {
        
            HStack {
                VStack{
                    Text("Set")
                    Text("\(index + 1)")
                      
                }
                VStack {
                        Text("Kg/lbs")
                        .offset(y:6)
                        Text(weight)
                        .keyboardType(.decimalPad)
                        .padding()
                        .contentShape(Rectangle())
                        .frame(width: 100 ,height: 30)
                        .border(.black,width:1)
                        
                            }
                VStack {
                            Text("Reps")
                            Text("\(reps)")
                        .offset(x: -2,y: 13)
                               .frame(width: 70,height: 10)
                               .padding()
                               .contentShape(Rectangle())
                               .border(.black,width:1)
                           }
            }
        }
}
    struct ExerciseFieldWithoutButtonPreview : PreviewProvider {
        static var previews: some View{
            ExerciseFieldWithoutButton(index: 1, weight: "aa", reps: 1)
                .environmentObject(NewSetViewViewModel())
        }
}


