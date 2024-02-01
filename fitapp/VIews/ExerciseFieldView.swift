//
//  ExerciseField.swift
//  fitapp
//
//  Created by Kuba Stefański on 07/01/2024.
//

import SwiftUI

struct ExerciseField: View {
    @EnvironmentObject var viewModel: NewSetViewViewModel
   // @ObservedObject private var viewModelE = ExerciseFieldViewModel()
    @ObservedObject private var viewModelE = infoView()
    let index: Int
    @State private var field = "Choose your Exercise"
    @State private var numberofset = 1
    @State private var weight = [0.0]
    @State private var reps = [0]
    @State var show = true
    
    
    var body: some View {
        if show{
            VStack {
                Picker("", selection: $field) {
                        ForEach(self.viewModelE.exeName, id: \.id) { exercise in
                            Text(exercise.id).tag(exercise.id)
                        }
                    }
                    .pickerStyle(.menu)
                
                .offset(x:-30)
                
                ForEach(0..<numberofset, id: \.self){
                    setIndex in ExerciseFieldRepsKG(index: setIndex, setnumber: numberofset, w: $weight, r: $reps)
                }
                
                TLButton(title: "+Add Set", background: .gray, titlebackground: .black)
                {
                    self.weight.append(0.0)
                    self.reps.append(0)
                    numberofset += 1
                    viewModel.numberofsets[index] = numberofset
                }
                
                .frame(width: 350 ,height: 20)
                .padding()
                .scaledToFit()
            }
           

            .onChange(of: field)
            {
                viewModel.title[index] = field
                Task{
                    try? await  self.viewModelE.getallname()
                }
            }
            .onChange(of: weight)
            {
                viewModel.weightS[index] = weight
            }
            .onChange(of: reps)
            {
                viewModel.numberofreps[index] = reps
            }
            .onAppear {
                show = true
                
            }
            .onDisappear {
                show = false
            }
            .task{
               
                  try? await  self.viewModelE.getallname()
            }
           
            
        }
    }
}
struct ExerciseFieldPreview : PreviewProvider {
            static var previews: some View{
                ExerciseField(index: 1)
                    .environmentObject(NewSetViewViewModel())
            }
        }

