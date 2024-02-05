//
//  ExerciseField.swift
//  fitapp
//
//  Created by Kuba Stefański on 07/01/2024.
//

import SwiftUI

struct ExerciseField: View {
    @EnvironmentObject var viewModel: NewSetViewViewModel
    @StateObject private var viewModelE = ExerciseFieldViewModel()
    let index: Int
    @State private var numberofset = 1
    @State private var weight = [0.0]
    @State private var reps = [0]
    @State var show = true
   
    
    var body: some View {
            VStack {
                Picker("", selection: $viewModelE.selectedExercise) {
                    ForEach(self.viewModelE.exeName, id: \.self) { exerciseID in
                        Text(exerciseID).tag(exerciseID)
                        }
                    }
                    .pickerStyle(.menu)
                
                .offset(x:-30)
                
                ForEach(0..<numberofset, id: \.self){
                    setIndex in ExerciseFieldRepsKG(index: setIndex, setnumber: numberofset, w: $weight, r: $reps)
                        .buttonStyle(.plain)
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
            }
           

            .onChange(of: viewModelE.selectedExercise)
            {

                viewModel.title[index] = viewModelE.selectedExercise
                
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
                
                Task{
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

