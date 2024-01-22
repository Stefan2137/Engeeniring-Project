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
    let setnumber: Int
    @Binding var w:[Double]
    @Binding var r:[Int]

    
    
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
                    TextField("Kg/lbs",value:$w[index] ,format: .number)
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
                            Picker("",selection: $r[index])
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
        }
}

struct ExerciseFieldRepsKGPreview : PreviewProvider {
    static var previews: some View{
        ExerciseFieldRepsKG(index: 0, setnumber: 1, w: Binding.constant([0.0]), r: Binding.constant([0]))
            .environmentObject(NewSetViewViewModel())
    }
}
