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
    @State private var sets = 1
    
    var body: some View {
        
            HStack {
                VStack{
                    Text("Set")
                    TextField("Set",value: $sets,formatter: NumberFormatter())
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                VStack {
                        Text("Kg/lbs")
                        TextField("Kg/lbs", text: $weight)
                        .keyboardType(.decimalPad)
                        .padding()
                        .contentShape(Rectangle())
                        .border(.black,width:1)
                            }
                VStack {
                            Text("Reps")
                                   .offset(x: -2)
                            Picker("",selection: $reps   )
                               {
                                   ForEach(0..<100)
                                   {
                                       Text("\($0)")
                                   }
                               }
                               .frame(width: 30,height: 30)
                               .padding()
                               .contentShape(Rectangle())
                               .border(.black,width:1)
                           }
                
            }
        }
        
        private func store() {
            viewModel.weightS[index] = weight
            viewModel.numberofreps[index] = reps
        }
}

struct ExerciseFieldRepsKGPreview : PreviewProvider {
    static var previews: some View{
        ExerciseFieldRepsKG(index: 1)
            .environmentObject(NewSetViewViewModel())
    }
}
