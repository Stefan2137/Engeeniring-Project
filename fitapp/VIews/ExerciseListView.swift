//
//  ExerciseList.swift
//  fitapp
//
//  Created by Kuba Stefański on 15/10/2023.
//

import SwiftUI

struct ExerciseList: View {
    @StateObject private var viewModel = infoView()

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.exeName , id: \.self) { exercise in
                    NavigationLink(destination: ExerciseInfromationView(info: exercise.id, DiffLvL: exercise.Difficulty_Level, Exercise_Classification: exercise.Exercise_Classification ?? nil, Grip: exercise.Grip, Muscle_Group: exercise.Muscle_Group ?? nil, Posture: exercise.Posture ?? nil, Primary_Equipment: exercise.Primary_Equipment, Prime_Mover_Muscle: exercise.Prime_Mover_Muscle, Secondary_Equipment: exercise.Secondary_Equipment ?? nil, Secondary_Muscle: exercise.Secondary_Muscle ?? nil, Short_Youtube_Demonstration: exercise.Short_Youtube_Demonstration ?? "No key", Single_Or_Double_Arm: exercise.Single_Or_Double_Arm, Tertiary_Muscle: exercise.Tertiary_Muscle ?? nil)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(exercise.id)
                                    .font(.subheadline)
                                Text(exercise.Difficulty_Level)
                                Text(exercise.Grip)
                            }
                        }
                    }
                }
            }
            .toolbar(content:{
                ToolbarItem(placement: .navigationBarLeading){
                    Menu("Filter: \(viewModel.sortOption?.rawValue ?? "None")"){
                        ForEach(infoView.SortOption.allCases, id: \.self){
                            filterOption in
                            Button(filterOption.rawValue){
                                Task{
                                   try? await viewModel.filterselected(option: filterOption)
                                }
                            }
                        }
                    }
                }
            })
            .navigationBarTitle("Exercises Library")
            .task{
                try? await viewModel.getallname()
            }
        }
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList()
    }
}

