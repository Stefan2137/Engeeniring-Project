//
//  ExerciseFieldRepsKG.swift
//  fitapp
//
//  Created by Kuba Stefański on 07/01/2024.
//

import SwiftUI

struct ExerciseFieldRepsKG: View {
    @EnvironmentObject var viewModel: NewSetViewViewModel
    let index: Int
    @State private var weight = ""
    @State private var reps = 0
    
    
    var body: some View {
        
            HStack {
                VStack{
                    Text("Set")
                    Text("\(index + 1)")
                      
                }
                .scaledToFit()
                VStack {
                        Text("Kg/lbs")
                        .offset(y:6)
                        TextField("Kg/lbs", text: $weight)
                        .keyboardType(.decimalPad)
                        .padding()
                        .contentShape(Rectangle())
                        .frame(width: 100 ,height: 30)
                        .border(.black,width:1)
                        
                            }
                .scaledToFit()
                VStack {
                            Text("Reps")
                        .offset(x: -2,y: 13)
                            Picker("",selection: $reps   )
                               {
                                   ForEach(0..<100)
                                   {
                                       Text("\($0)")
                                   }
                               }
                               .frame(width: 70,height: 10)
                               .padding()
                               .contentShape(Rectangle())
                               .border(.black,width:1)
                           }
                .scaledToFit()
            }
            .onChange(of: weight) {
                viewModel.weightS[index] = weight
            }
            .onChange(of: reps){
                viewModel.numberofreps[index] = reps
            }
        }
}

struct ExerciseFieldRepsKGPreview : PreviewProvider {
    static var previews: some View{
        ExerciseFieldRepsKG(index: 1)
            .environmentObject(NewSetViewViewModel())
    }
}
